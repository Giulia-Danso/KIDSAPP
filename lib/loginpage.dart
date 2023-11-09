import 'main.dart';
import 'package:flutter/material.dart';
import 'registration.dart';
import 'contact.dart';
// Define LoginScreen widget
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    const String hardcodedUsername = 'User';
    const hardcodedPassword = 'Password';

    String enteredUsername = usernameController.text.trim();
    String enteredPassword = passwordController.text.trim();

    if (enteredUsername == hardcodedPassword &&
        enteredPassword == hardcodedUsername) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatApp(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //login UI here
    return Container(
      // login screen content
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              handleLogin(context);
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
