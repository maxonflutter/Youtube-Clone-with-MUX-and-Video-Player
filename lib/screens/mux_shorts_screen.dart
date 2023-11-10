import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/app_nav_bar.dart';

class MuxShortsScreen extends StatefulWidget {
  const MuxShortsScreen({super.key});

  @override
  State<MuxShortsScreen> createState() => _MuxShortsScreenState();
}

class _MuxShortsScreenState extends State<MuxShortsScreen> {
  late PageController _pageController;
  final List<VideoPlayerController> _controllers = [];
  final List<ValueNotifier<double>> _progressIndicators = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // String playbackId = assetData.playbackIds[0].id;

    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    //     int.parse(assetData.createdAt) * 1000);
    // DateFormat formatter = DateFormat.yMd().add_jm();
    // dateTimeString = formatter.format(dateTime);

    for (var videoPath in [
      'https://stream.mux.com/X00LQSIx9elquxTQEX02FaW7xDlsJZh6iUqBwvihQ9nVQ.m3u8',
      'https://stream.mux.com/QnV4dLt8wowBf4xVGwUzDc8fPQVAEUS7gVa9VpfTAZU.m3u8',
      'https://stream.mux.com/Z02qixunSiuC4QbgAeHuxBDUkXobnxLgUVAR2ZGl29cU.m3u8',
    ]) {
      VideoPlayerController controller = VideoPlayerController.networkUrl(
        Uri.parse(videoPath),
      )..initialize().then((_) {
          setState(() {});
        });
      controller.play();
      controller.setLooping(true);

      _controllers.add(controller);
      _progressIndicators.add(ValueNotifier<double>(0.0));

      controller.addListener(() {
        _updateProgress(controller);
      });
    }
  }

  void _updateProgress(VideoPlayerController controller) {
    int controllerIndex = _controllers.indexOf(controller);
    if (controllerIndex != -1) {
      double progress = controller.value.position.inSeconds /
          controller.value.duration.inSeconds;
      _progressIndicators[controllerIndex].value = progress;
    }
  }

  void _loadMoreVideos() {
    List<String> moreVideoPaths = [
      'assets/videos/video_4.mp4',
      'assets/videos/video_5.mp4',
      'assets/videos/video_6.mp4',
    ];

    for (var videoPath in moreVideoPaths) {
      VideoPlayerController controller = VideoPlayerController.asset(videoPath)
        ..initialize().then((_) {
          setState(() {});
        });
      _controllers.add(controller);
      _progressIndicators.add(ValueNotifier<double>(0.0));

      controller.addListener(() {
        _updateProgress(controller);
      });
    }
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
        scrolledUnderElevation: 0.0,
        title: const Text('MuxShorts'),
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
          if (value >= _controllers.length - 1) {
            _loadMoreVideos();
          }
        },
        itemBuilder: (context, index) {
          VideoPlayerController controller = _controllers[index];
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
}
