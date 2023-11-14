import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone_with_mux_and_video_player/services/video_client.dart';

import '../models/video.dart';
import '../repositories/video_repository.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/video_actions.dart';
import '../widgets/video_information.dart';
import '../widgets/video_options_modal.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late PageController _pageController;
  final List<Video> _videos = [];
  final List<VideoPlayerController> _controllers = [];
  final List<ValueNotifier<double>> _progressIndicators = [];

  bool loading = true;

  @override
  void initState() {
    _pageController = PageController();
    _loadVideos();
    super.initState();
  }

  _loadVideos() async {
    setState(() {
      loading = true;
    });
    final videos = await VideoRepository(client: VideoClient()).getVideos();
    _videos.addAll(videos);

    for (var video in videos) {
      final muxAsset = video.muxAsset;
      final url = Uri.parse(
          '${VideoClient.muxStreamBaseUrl}/${muxAsset?.playbackId}.m3u8');
      VideoPlayerController controller = VideoPlayerController.networkUrl(url)
        ..initialize().then((_) {
          setState(() {});
        });
      _controllers.add(controller);
      _progressIndicators.add(ValueNotifier<double>(0.0));

      controller.addListener(() {
        _updateProgress(controller);
      });

      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.removeListener(() {});
      controller.dispose();
    }

    for (var progressIndicator in _progressIndicators) {
      progressIndicator.dispose();
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
            onPressed: () {},
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
        itemCount: _controllers.length,
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        onPageChanged: (value) {
          for (var i = 0; i < _controllers.length; i++) {
            if (i != value) {
              _controllers[i].pause();
            } else {
              _controllers[i].play();
            }
          }
          if (value == _controllers.length - 1) {
            _loadVideos();
          }
        },
        itemBuilder: (context, index) {
          final controller = _controllers[index];
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
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: ValueListenableBuilder<double>(
                        valueListenable: _progressIndicators[index],
                        builder: (context, value, child) {
                          return LinearProgressIndicator(
                              value: value,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primary,
                              ));
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
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Center(child: CircularProgressIndicator()),
                );
        },
      ),
      bottomNavigationBar: const AppNavBar(),
    );
  }

  void _updateProgress(VideoPlayerController controller) {
    int controllerIndex = _controllers.indexOf(controller);
    if (controllerIndex == -1) {
      return;
    }
    final progress = controller.value.position.inMilliseconds /
        controller.value.duration.inMilliseconds;
    _progressIndicators[controllerIndex].value = progress;
  }
}
