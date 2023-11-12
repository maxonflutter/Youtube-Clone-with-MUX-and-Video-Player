import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodySmall!.copyWith(
                letterSpacing: 0.5,
                fontSize: 10,
                color: colorScheme.onSecondary,
              ),
        ),
      ),
      child: NavigationBar(
        backgroundColor: colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        height: 60,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: colorScheme.onSecondary,
            ),
            label: 'Home',
            selectedIcon: Icon(
              Icons.home,
              color: colorScheme.onSecondary,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.youtube_searched_for_outlined,
              color: colorScheme.onSecondary,
            ),
            label: 'Shorts',
            selectedIcon: Icon(
              Icons.youtube_searched_for,
              color: colorScheme.onSecondary,
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: colorScheme.onSecondary,
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: colorScheme.onSecondary,
            ),
          ),
          NavigationDestination(
            icon: Icon(
              Icons.subscriptions_outlined,
              color: colorScheme.onSecondary,
            ),
            label: 'Subscriptions',
            selectedIcon: Icon(
              Icons.subscriptions,
              color: colorScheme.onSecondary,
            ),
          ),
          const NavigationDestination(
            icon: CircleAvatar(
              radius: 16,
              child: Text('M'),
            ),
            label: 'You',
          ),
        ],
      ),
    );
  }
}
