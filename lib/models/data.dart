import 'dart:convert';

import 'playback_id.dart';
import 'track.dart';

class Data {
  Data({
    required this.test,
    required this.maxStoredFrameRate,
    required this.status,
    required this.tracks,
    required this.id,
    required this.maxStoredResolution,
    required this.masterAccess,
    required this.playbackIds,
    required this.createdAt,
    required this.duration,
    required this.mp4Support,
    required this.aspectRatio,
  });

  bool test;
  double maxStoredFrameRate;
  String status;
  List<Track> tracks;
  String id;
  String maxStoredResolution;
  String masterAccess;
  List<PlaybackId> playbackIds;
  String createdAt;
  double duration;
  String mp4Support;
  String aspectRatio;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'],
        test: json['test'],
        maxStoredFrameRate: json['max_stored_frame_rate']?.toDouble(),
        status: json['status'],
        tracks: List<Track>.from(
          json['tracks'].map(
            (track) => Track.fromJson(track),
          ),
        ),
        maxStoredResolution: json['max_stored_resolution'],
        masterAccess: json['master_access'],
        playbackIds: List<PlaybackId>.from(
          json['playback_ids'].map(
            (x) => PlaybackId.fromJson(x),
          ),
        ),
        createdAt: json['created_at'],
        duration: json['duration']?.toDouble(),
        mp4Support: json['mp4_support'],
        aspectRatio: json['aspect_ratio'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'test': test,
        'max_stored_frame_rate': maxStoredFrameRate,
        'status': status,
        'tracks': List<dynamic>.from(tracks.map((x) => x.toJson())),
        'max_stored_resolution': maxStoredResolution,
        'master_access': masterAccess,
        'playback_ids': List<dynamic>.from(playbackIds.map((x) => x.toJson())),
        'created_at': createdAt,
        'duration': duration,
        'mp4_support': mp4Support,
        'aspect_ratio': aspectRatio,
      };
}
