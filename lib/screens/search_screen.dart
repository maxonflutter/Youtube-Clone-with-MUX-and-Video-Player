import 'package:flutter/material.dart';

const textPlaceholder = 'Text placeholder';

// Title: Search bar with dialog and hero transition
// seba-diht19

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          textPlaceholder,
          style: textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.local_fire_department),
            title: Text('$textPlaceholder $index'),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}