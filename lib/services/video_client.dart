import 'dart:convert';

import 'package:http/http.dart' as http;

import '../env/env.dart';

class VideoClient {
  final http.Client _client;

  VideoClient({http.Client? client}) : _client = client ?? http.Client();

  static const muxStreamBaseUrl = 'https://stream.mux.com';

  static const videoExtension = '.m3u8';

  Future<Map<String, dynamic>> getMuxAssets() async {
    final muxTokenId = Env.MUX_TOKEN_ID;
    final muxSecretKey = Env.MUX_SECRET_KEY;

    final response = await _client.get(
        Uri.parse('https://api.mux.com/video/v1/assets'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$muxTokenId:$muxSecretKey'))}',
        });

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load assets');
    }
  }

  Future<Map<String, dynamic>> getMuxAsset(String assetId) async {
    final muxTokenId = Env.MUX_TOKEN_ID;
    final muxSecretKey = Env.MUX_SECRET_KEY;

    final response = await _client.get(
        Uri.parse('https://api.mux.com/video/v1/assets/$assetId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'Basic ${base64Encode(utf8.encode('$muxTokenId:$muxSecretKey'))}',
        });

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load the asset from MUX');
    }
  }
}
