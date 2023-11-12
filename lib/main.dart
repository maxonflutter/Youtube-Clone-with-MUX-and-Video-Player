import 'package:flutter/material.dart';

import 'screens/search_screen.dart';
import 'screens/shorts_screen.dart';
import 'shared/theme.dart';

void main() {
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
