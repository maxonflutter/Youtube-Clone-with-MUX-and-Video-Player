import 'dart:convert';

import 'data.dart';

class VideoData {
  VideoData({this.data});

  Data? data;

  factory VideoData.fromRawJson(String str) =>
      VideoData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}
