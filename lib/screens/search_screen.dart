import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        leading: const BackButton(color: Colors.white),
        titleSpacing: 8,
        title: Container(
          margin: const EdgeInsets.only(bottom: 4.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search YouTube',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white.withAlpha(150)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none,
              ),
              fillColor: colorScheme.secondaryContainer.withAlpha(100),
              filled: true,
            ),
          ),
        ),
        actions: [
          IconButton.filled(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            icon: const Icon(Icons.mic, color: Colors.white),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(
              Icons.replay,
              color: Colors.white,
            ),
            title: Text(
              'Item $index',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          );
        },
      ),
    );
  }
}
