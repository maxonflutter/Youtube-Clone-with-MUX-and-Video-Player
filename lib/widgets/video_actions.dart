import 'package:flutter/material.dart';

class VideoActions extends StatelessWidget {
  const VideoActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _VideoActionButton(
            onPressed: () {},
            icon: Icons.thumb_up,
            label: '12K',
          ),
          const SizedBox(height: 12.0),
          _VideoActionButton(
            onPressed: () {},
            icon: Icons.thumb_down,
            label: 'Dislike',
          ),
          const SizedBox(height: 12.0),
          _VideoActionButton(
            onPressed: () {},
            icon: Icons.comment,
            label: '100',
          ),
          const SizedBox(height: 12.0),
          _VideoActionButton(
            onPressed: () {},
            icon: Icons.forward,
            label: 'Share',
          ),
          const SizedBox(height: 12.0),
          _VideoActionButton(
            onPressed: () {},
            icon: Icons.swap_vert_outlined,
            label: 'Remix',
          ),
          const SizedBox(height: 12.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://picsum.photos/200/300',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class _VideoActionButton extends StatelessWidget {
  const _VideoActionButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        fixedSize: const Size(60.0, 60.0),
      ),
      onPressed: onPressed,
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
