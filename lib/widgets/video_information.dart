import 'package:flutter/material.dart';

import '../models/video.dart';

class VideoInformation extends StatelessWidget {
  const VideoInformation({
    super.key,
    required this.video,
  });

  final Video video;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: size.width * 0.8,
      ),
    );
  }
}
