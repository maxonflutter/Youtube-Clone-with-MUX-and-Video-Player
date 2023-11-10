import 'package:equatable/equatable.dart';

import 'mux_asset.dart';

class Video extends Equatable {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String muxId;
  final MuxAsset? muxAsset;

  const Video({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.muxId,
    this.muxAsset,
  });

  Video copyWith({
    String? id,
    String? title,
    String? description,
    String? createdAt,
    String? muxId,
    MuxAsset? muxAsset,
  }) {
    return Video(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      muxId: muxId ?? this.muxId,
      muxAsset: muxAsset ?? this.muxAsset,
    );
  }

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['created_at'],
      muxId: json['muxId'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        muxId,
        muxAsset,
      ];

  static List<Map<String, dynamic>> sampleVideos = [
    {
      "id": "1",
      "title": "Exploring the Mountains",
      "description": "A journey through the landscapes of the mountains.",
      "created_at": "2023-11-01",
      "muxId": "mKGU02YvT7Wh1gbX6zyvceRcaDF02BSh81zxr72eo9CFQ",
    },
    {
      "id": "2",
      "title": "Urban Adventures",
      "description": "Discover the hidden gems of city life.",
      "created_at": "2023-11-01",
      "muxId": "700qOTgjT01Be4f9a1UCFeGBw3NIOHb5GLncp7hK4c5Uk",
    },
    {
      "id": "3",
      "title": "Ocean Wonders",
      "description": "Exploring the mysteries of the ocean.",
      "created_at": "2023-1-01",
      "muxId": "eQ027icxueTuklSx01wmrEQEvU4Mj4TcQeF19k2t7202KQ",
    },
    {
      "id": "4",
      "title": "Rainforest Treasures",
      "description": "A journey through the rainforest.",
      "created_at": "2023-11-01",
      "muxId": "NnIcvc02eTiI8YrfnPZ2HgGLbO02TWWPmevtuXxqwVsRM",
    }
  ];
}
