import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../env/env.dart';
import '../models/asset_data.dart';

// class MUXClient {
//   Dio _dio = Dio();

//   /// Method for configuring Dio, the authorization is done from
//   /// the API server
//   initializeDio() {
//     BaseOptions options = BaseOptions(
//       baseUrl: muxServerUrl,
//       connectTimeout: 8000,
//       receiveTimeout: 5000,
//       headers: {
//         "Content-Type": contentType, // application/json
//       },
//     );
//     _dio = Dio(options);
//   }

class VideoClient {
  final http.Client _client;

  VideoClient({
    http.Client? client,
  }) : _client = client ?? http.Client();

  // API for sending videos
  static const muxBaseUrl = 'https://api.mux.com';

// API server running on localhost
  static const muxServerUrl = 'http://localhost:3000';

// API for generating thumbnails of a video
  static const muxImageBaseUrl = 'https://image.mux.com';

// API for streaming a video
  static const muxStreamBaseUrl = 'https://stream.mux.com';

// Received video file format
  static const videoExtension = 'm3u8';

// Thumbnail file type and size
  static const imageTypeSize = 'thumbnail.jpg?time=5&width=200';

// Content Type used in API calls
  static const contentType = 'application/json';

// Test video url provided by MUX
  static const demoVideoUrl =
      'https://storage.googleapis.com/muxdemofiles/mux-video-intro.mp4';

  /// Method for retrieving the entire asset list.
  ///
  /// Returns the `AssetData`.
  Future<void> getAssetList() async {
    try {
      Response response = await _client.get(
        Uri.parse('$muxBaseUrl/video/v1/assets/'),
      );

      if (response.statusCode == 200) {
        print(response.body);
        // AssetData assetData = AssetData.fromJson(response.body);
        // return assetData;
      }
    } catch (e) {
      print('Error starting build: $e');
      throw Exception('Failed to retireve videos from MUX');
    }
  }

  Future<http.Response> fetchMuxAssets() async {
    const String muxTokenId = 'YOUR_MUX_TOKEN_ID';
    const String muxTokenSecret = 'YOUR_MUX_TOKEN_SECRET';

    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${Env.MUX_TOKEN_ID}:${Env.MUX_SECRET_KEY}'))}';

    final response = await http.get(
      Uri.parse('https://api.mux.com/video/v1/assets'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load assets');
    }
  }
}
