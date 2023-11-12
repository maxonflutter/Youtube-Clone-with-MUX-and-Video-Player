import 'package:flutter/material.dart';

import '../widgets/app_nav_bar.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0.0,
        actions: [],
      ),
      extendBodyBehindAppBar: true,
      body: Container(),
      bottomNavigationBar: const AppNavBar(),
    );
  }
}
