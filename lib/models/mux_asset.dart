class MuxAsset {
  final String uploadId;
  final String playbackId;
  final Duration duration;
  final DateTime createdAt;

  const MuxAsset({
    required this.uploadId,
    required this.playbackId,
    required this.duration,
    required this.createdAt,
  });

  factory MuxAsset.fromJson(Map<String, dynamic> json) {
    final duration = Duration(milliseconds: (json['duration'] * 1000).toInt());
    final createdAt = DateTime.fromMillisecondsSinceEpoch(
        int.parse(json['created_at']) * 1000);

    return MuxAsset(
      uploadId: json['upload_id'],
      playbackId: json['playback_ids'][0]['id'],
      duration: duration,
      createdAt: createdAt,
    );
  }
}
