import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodySmall,
        ),
      ),
      child: NavigationBar(
        height: 60,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
          const NavigationDestination(
            icon: Icon(Icons.youtube_searched_for_outlined),
            label: 'Shorts',
            selectedIcon: Icon(Icons.youtube_searched_for),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
            ),
          ),
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Subscriptions',
            selectedIcon: Icon(Icons.home),
          ),
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
