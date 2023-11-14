import 'package:flutter/material.dart';
import 'services/video_client.dart';

import 'screens/search_screen.dart';
import 'screens/mux_shorts_screen.dart';
import 'shared/theme.dart';

Future<void> main() async {
  // final videoClient = VideoClient();
  // final muxAssets = await videoClient.getMuxAssets();
  // print(muxAssets);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: const AppTheme().themeData,
      initialRoute: '/shorts',
      routes: {
        '/shorts': (context) => const ShortsScreen(),
        '/search': (context) => const SearchScreen(),
      },
    );
  }
}
