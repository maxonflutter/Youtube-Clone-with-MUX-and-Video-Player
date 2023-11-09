import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/app_nav_bar.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late PageController _pageController;
  final List<VideoPlayerController> _controllers = [];
  final List<ValueNotifier<double>> _progressIndicators = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    for (var videoPath in [
      'assets/videos/video_1.mp4',
      'assets/videos/video_2.mp4',
      'assets/videos/video_3.mp4',
    ]) {
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
        title: const Text('Shorts'),
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
