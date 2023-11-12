import 'package:flutter/material.dart';

class VideoOptionsModal extends StatelessWidget {
  const VideoOptionsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: colorScheme.secondary,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(
              Icons.description_outlined,
              color: colorScheme.onSecondary,
            ),
            title: Text(
              'Description',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.playlist_add_outlined,
              color: colorScheme.onSecondary,
            ),
            title: Text(
              'Save to playlist',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.closed_caption_off_outlined,
              color: colorScheme.onSecondary,
            ),
            title: Text(
              'Captions',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.report_off_outlined,
              color: colorScheme.onSecondary,
            ),
            title: Text(
              'Don\'t recommend this channel',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.flag_outlined,
              color: colorScheme.onSecondary,
            ),
            title: Text(
              'Report',
              style: textTheme.bodyLarge!.copyWith(
                color: colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
