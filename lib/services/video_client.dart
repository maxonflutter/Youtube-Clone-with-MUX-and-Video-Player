import 'dart:convert';

import 'package:http/http.dart' as http;

import '../env/env.dart';

class VideoClient {
  final http.Client _client;

  VideoClient({
    http.Client? client,
  }) : _client = client ?? http.Client();

// API for streaming a video
  static const muxStreamBaseUrl = 'https://stream.mux.com';

// Received video file format
  static const videoExtension = 'm3u8';

  Future<Map<String, dynamic>> getAssets() async {
    final muxTokenId = Env.MUX_TOKEN_ID;
    final muxTokenSecret = Env.MUX_SECRET_KEY;

    final response = await _client.get(
      Uri.parse('https://api.mux.com/video/v1/assets'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$muxTokenId:$muxTokenSecret'))}',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load the assets from MUX');
    }
  }
}
