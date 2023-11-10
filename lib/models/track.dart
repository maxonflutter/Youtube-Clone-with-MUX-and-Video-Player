import 'dart:convert';

class Track {
  Track({
    required this.maxWidth,
    required this.type,
    required this.id,
    required this.duration,
    required this.maxFrameRate,
    required this.maxHeight,
    required this.maxChannelLayout,
    required this.maxChannels,
  });

  int maxWidth;
  String type;
  String id;
  double duration;
  double maxFrameRate;
  int maxHeight;
  String maxChannelLayout;
  int maxChannels;

  factory Track.fromRawJson(String str) => Track.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        maxWidth: json["max_width"],
        type: json["type"],
        id: json["id"],
        duration: json["duration"]?.toDouble,
        maxFrameRate: json["max_frame_rate"]?.toDouble(),
        maxHeight: json["max_height"],
        maxChannelLayout: json["max_channel_layout"],
        maxChannels: json["max_channels"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "max_width": maxWidth,
        "type": type,
        "duration": duration,
        "max_frame_rate": maxFrameRate,
        "max_height": maxHeight,
        "max_channel_layout": maxChannelLayout,
        "max_channels": maxChannels,
      };
}
