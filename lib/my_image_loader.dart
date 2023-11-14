import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyImageLoader extends StatelessWidget {
  final String imageUrl;

  MyImageLoader({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheImage(NetworkImage(imageUrl), context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Image.network(imageUrl),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
            ),
          );
        } else {
          return const Text('Error loading image');
        }
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyImageLoader(
          imageUrl:
              'https://images.pexels.com/photos/1191710/pexels-photo-1191710.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        ),
      ),
    ),
  );
}
