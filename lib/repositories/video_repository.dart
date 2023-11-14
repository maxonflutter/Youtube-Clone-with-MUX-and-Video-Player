import '../models/mux_asset.dart';
import '../models/video.dart';
import '../services/video_client.dart';

class VideoRepository {
  final VideoClient _client;
  const VideoRepository({
    required VideoClient client,
  }) : _client = client;

  Future<List<Video>> getVideos() async {
    try {
      final videos = await Future.delayed(
        const Duration(seconds: 1),
        () => Video.sampleVideos
            .map((videoJson) => Video.fromJson(videoJson))
            .toList(),
      );

      final updatedVideos = <Video>[];
      for (var video in videos) {
        final muxAssetJson = await _client.getMuxAsset(video.muxId);
        final muxAsset = MuxAsset.fromJson(muxAssetJson['data']);
        updatedVideos.add(video.copyWith(muxAsset: muxAsset));
      }
      return updatedVideos;
    } catch (err) {
      throw Exception('Failed to load videos');
    }
  }
}
