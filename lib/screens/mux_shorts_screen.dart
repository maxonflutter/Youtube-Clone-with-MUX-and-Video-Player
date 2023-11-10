import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/video.dart';
import '../repositories/video_repository.dart';
import '../services/video_client.dart';
import '../widgets/app_nav_bar.dart';
import '../widgets/video_actions.dart';
import '../widgets/video_information.dart';

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

  void _updateProgress(VideoPlayerController controller) {
    int controllerIndex = _controllers.indexOf(controller);
    if (controllerIndex != -1) {
      double progress = controller.value.position.inSeconds /
          controller.value.duration.inSeconds;
      _progressIndicators[controllerIndex].value = progress;
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
          if (value >= _controllers.length - 2) {
            _loadVideos();
          }
        },
        itemBuilder: (context, index) {
          Video video = _videos[index];
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
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: VideoInformation(video: video),
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: VideoActions(),
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

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:youtube_clone_with_mux_and_video_player/widgets/video_actions.dart';

// import '../repositories/video_repository.dart';
// import '../services/video_client.dart';
// import '../widgets/app_nav_bar.dart';

// class MuxShortsScreen extends StatefulWidget {
//   const MuxShortsScreen({super.key});

//   @override
//   State<MuxShortsScreen> createState() => _MuxShortsScreenState();
// }

// class _MuxShortsScreenState extends State<MuxShortsScreen> {
//   late PageController _pageController;
//   final List<VideoPlayerController> _controllers = [];
//   final List<ValueNotifier<double>> _progressIndicators = [];

//   bool loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//     _loadVideos();
//   }

//   Future<void> _loadVideos() async {
//     final videos = await VideoRepository(client: VideoClient()).getVideos();

//     for (var videoPath in videos) {
//       final url = Uri.parse(
//         '${VideoClient.muxStreamBaseUrl}/${videoPath.playbackId}.${VideoClient.videoExtension}',
//       );

//       VideoPlayerController controller = VideoPlayerController.networkUrl(url)
//         ..initialize().then((_) {
//           setState(() {});
//         })
//         ..play()
//         ..setLooping(true);

//       _controllers.add(controller);
//       _progressIndicators.add(ValueNotifier<double>(0.0));
//       controller.addListener(() {
//         _updateProgress(controller);
//       });
//     }

//     setState(() {
//       loading = false;
//     });
//   }

//   void _updateProgress(VideoPlayerController controller) {
//     int controllerIndex = _controllers.indexOf(controller);
//     if (controllerIndex != -1) {
//       double progress = controller.value.position.inSeconds /
//           controller.value.duration.inSeconds;
//       _progressIndicators[controllerIndex].value = progress;
//     }
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.removeListener(() {});
//       controller.dispose();
//     }
//     for (var notifier in _progressIndicators) {
//       notifier.dispose();
//     }
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         scrolledUnderElevation: 0.0,
//         title: const Text('MuxShorts'),
//       ),
//       extendBodyBehindAppBar: true,
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical,
//         itemCount: _controllers.length,
//         pageSnapping: true,
//         onPageChanged: (value) {
//           for (var i = 0; i < _controllers.length; i++) {
//             if (i == value) {
//               _controllers[i].play();
//             } else {
//               _controllers[i].pause();
//             }
//           }
//           if (value >= _controllers.length - 1) {
//             _loadVideos();
//           }
//         },
//         itemBuilder: (context, index) {
//           VideoPlayerController controller = _controllers[index];
//           return controller.value.isInitialized
//               ? Stack(
//                   fit: StackFit.expand,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: controller.value.aspectRatio,
//                       child: VideoPlayer(controller),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       left: 0,
//                       right: 0,
//                       child: ValueListenableBuilder<double>(
//                         valueListenable: _progressIndicators[index],
//                         builder: (context, value, child) {
//                           return LinearProgressIndicator(
//                             value: value,
//                             backgroundColor: Colors.grey,
//                             valueColor:
//                                 const AlwaysStoppedAnimation<Color>(Colors.red),
//                           );
//                         },
//                       ),
//                     ),
//                     const Align(
//                       alignment: Alignment.bottomRight,
//                       child: VideoActions(),
//                     ),
//                   ],
//                 )
//               : Container(
//                   color: Colors.black,
//                   child: const Center(child: CircularProgressIndicator()),
//                 );
//         },
//       ),
//       bottomNavigationBar: const AppNavBar(),
//     );
//   }
// }
