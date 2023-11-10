import 'package:flutter/material.dart';

import '../models/mux_asset.dart';
import '../services/video_client.dart';

class VideoRepository {
  const VideoRepository({required VideoClient client}) : _client = client;

  final VideoClient _client;

  Future<List<MuxAsset>> getVideos() async {
    try {
      final response = await _client.getAssets();
      final videos = (response['data'] as List).map((video) {
        return MuxAsset.fromJson(video);
      }).toList();

      return videos;
    } catch (err) {
      debugPrint(err.toString());
      throw Exception('Failed to retireve videos from MUX');
    }
  }
}
