import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyImageLoader(),
    );
  }
}

class MyImageLoader extends StatelessWidget {
  final String imageUrl =
      'https://images.pexels.com/photos/733857/pexels-photo-733857.jpeg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chached Network Image'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl:
              'https://images.pexels.com/photos/733857/pexels-photo-733857.jpeg',
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
