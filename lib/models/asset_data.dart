import 'dart:convert';

import 'data.dart';

class AssetData {
  AssetData({
    required this.data,
  });

  List<Data> data;

  factory AssetData.fromRawJson(String str) =>
      AssetData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssetData.fromJson(Map<String, dynamic> json) => AssetData(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
