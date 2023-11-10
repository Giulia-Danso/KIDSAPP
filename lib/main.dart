import 'package:flutter/material.dart';
import 'package:kidsapp/chatapp.dart';
import 'loginpage.dart';
import 'registration.dart';
import 'settingsscreen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/login': (context) => LoginScreen(),
      '/register': (context) => RegistrationScreen(),
      '/chat': (context) => ChatApp(),
      '/settings': (context) => SettingsScreen(),
    },
    onGenerateRoute: (settings) {
      if (settings.name == "/register") {
        return MaterialPageRoute(builder: (context) => RegistrationScreen());
      } else if (settings.name == "/custom_route") {
        return MaterialPageRoute(builder: (context) => CustomScreen());
      }

      return MaterialPageRoute(builder: (context) => NotFoundScreen());
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatApp(),
    );
  }
}

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Route!'),
      ),
      body: const Center(
        child: Text('This is a custom route!'),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found!'),
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  }
}
