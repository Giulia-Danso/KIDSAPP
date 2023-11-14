import 'package:flutter/material.dart';
import 'package:kidsapp/chat_screen.dart';
import 'package:kidsapp/chatapp.dart';
import 'loginpage.dart';
import 'registration.dart';
import 'settingsscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ChatApp(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/chat': (context) => ChatScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/register") {
        } else if (settings.name == "/custom_route") {
          return MaterialPageRoute(builder: (context) => CustomScreen());
        }

        return MaterialPageRoute(builder: (context) => NotFoundScreen());
      },
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
