import 'package:flutter/material.dart';

const textPlaceholder = 'Text placeholder';
const imagePlaceholder = 'https://source.unsplash.com/random/?nature';

// Title: Search bar with dialog and hero transition
// seba-diht19

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Hero(
          tag: 'search',
          child: Material(
            color: Colors.transparent,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: colorScheme.onPrimary,
                ),
                filled: true,
                fillColor: colorScheme.primary.withAlpha(100),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // TODO: Implement search close action
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 10, // Sample data for youtube searches
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              // TODO: Implement search suggestion tap action
            },
            leading: const Icon(Icons.video_library),
            title: Text('Search suggestion $index'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
