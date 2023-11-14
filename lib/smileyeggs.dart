import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Image Display'),
        ),
        body: Center(
          child: Image.asset('lib/assets/glitters.jpeg'),
        ),
      ),
    );
  }
}
