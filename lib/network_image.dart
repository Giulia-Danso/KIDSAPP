import 'package:flutter/material.dart';

Future<Image> fetchImage() async {
  var http;
  final response = await http.get(
      'https://images.pexels.com/photos/733857/pexels-photo-733857.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

  if (response.statusCode == 200) {
    return Image.network(
        'https://images.pexels.com/photos/733857/pexels-photo-733857.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');
  } else {
    return Image.asset('assets/error_image.png');
  }
}

class MyImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Network Image '),
        ),
        body: Center(
          child: FutureBuilder<Image>(
              future: fetchImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Error loading image');
                } else {
                  return snapshot.data ?? Container();
                }
              }),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyImageApp());
}
