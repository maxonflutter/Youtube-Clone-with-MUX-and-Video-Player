import 'package:flutter/material.dart';

import '../models/mux_asset.dart';
import '../models/video.dart';
import '../services/video_client.dart';

class VideoRepository {
  const VideoRepository({required VideoClient client}) : _client = client;

  final VideoClient _client;

  Future<List<Video>> getVideos() async {
    try {
      final response = await _client.getVideosDetails();

      final videos = <Video>[];
      for (var videoJson in response['data']) {
        final muxAssetJson = await _client.getMuxAsset(videoJson['muxId']);
        final muxAsset = MuxAsset.fromJson(muxAssetJson['data']);
        final video = Video.fromJson(videoJson).copyWith(muxAsset: muxAsset);
        videos.add(video);
      }

      return videos;
    } catch (err) {
      debugPrint(err.toString());
      throw Exception('Failed to retrieve videos from MUX');
    }
  }

  // Future<List<Video>> getVideos() async {
  //   try {
  //     final response = await _client.getVideosDetails();
  //     print(response);
  //     // final videos = (response['data'] as List).map((video) {
  //     //   return MuxAsset.fromJson(video);
  //     // }).toList();

  //     // return videos;
  //   } catch (err) {
  //     debugPrint(err.toString());
  //     throw Exception('Failed to retrieve videos from MUX');
  //   }
  // }
}
