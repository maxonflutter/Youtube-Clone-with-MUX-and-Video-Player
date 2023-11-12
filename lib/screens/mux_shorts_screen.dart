import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/video.dart';
import '../repositories/video_repository.dart';
import '../services/video_client.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/video_actions.dart';
import '../widgets/video_information.dart';
import '../widgets/video_options_modal.dart';

class MuxShortsScreen extends StatefulWidget {
  const MuxShortsScreen({super.key});

  @override
  State<MuxShortsScreen> createState() => _MuxShortsScreenState();
}

class _MuxShortsScreenState extends State<MuxShortsScreen> {
  late PageController _pageController;
  final List<Video> _videos = [];
  final List<VideoPlayerController> _controllers = [];
  final List<ValueNotifier<double>> _progressIndicators = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    final videos = await VideoRepository(client: VideoClient()).getVideos();
    _videos.addAll(videos);

    for (Video videoPath in videos) {
      final muxAsset = videoPath.muxAsset;
      final url = Uri.parse(
        '${VideoClient.muxStreamBaseUrl}/${muxAsset?.playbackId}.${VideoClient.videoExtension}',
      );

      VideoPlayerController controller = VideoPlayerController.networkUrl(url)
        ..initialize().then((_) {
          setState(() {});
        })
        ..play()
        ..setLooping(true);

      _controllers.add(controller);
      _progressIndicators.add(ValueNotifier<double>(0.0));
      controller.addListener(() {
        _updateProgress(controller);
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.removeListener(() {});
      controller.dispose();
    }
    for (var notifier in _progressIndicators) {
      notifier.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/search'),
            icon: const Icon(
              Icons.search,
              size: 32,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return const VideoOptionsModal();
                },
              );
            },
            icon: const Icon(
              Icons.more_vert,
              size: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _controllers.length,
        pageSnapping: true,
        onPageChanged: (value) {
          for (var i = 0; i < _controllers.length; i++) {
            if (i == value) {
              _controllers[i].play();
            } else {
              _controllers[i].pause();
            }
          }
          if (value >= _controllers.length - 3) {
            _loadVideos();
          }
        },
        itemBuilder: (context, index) {
          VideoPlayerController controller = _controllers[index];
          controller
            ..play()
            ..setLooping(true);
          return controller.value.isInitialized
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ValueListenableBuilder<double>(
                        valueListenable: _progressIndicators[index],
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                            value: value,
                            backgroundColor: Colors.grey,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(Colors.red),
                          );
                        },
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: VideoActions(),
                    ),
                    Positioned(
                      bottom: 8.0,
                      child: VideoInformation(video: _videos[index]),
                    ),
                  ],
                )
              : Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator()),
                );
        },
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }

  void _updateProgress(VideoPlayerController controller) {
    int controllerIndex = _controllers.indexOf(controller);
    if (controllerIndex != -1) {
      double progress = controller.value.position.inSeconds /
          controller.value.duration.inSeconds;
      _progressIndicators[controllerIndex].value = progress;
    }
  }
}
