import 'package:flutter/material.dart';

// Define LoginScreen widget

// define Registration widget here
class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegistrationScreen({super.key});

  void handleRegistration(BuildContext context) {
    // Perform registration logic here

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration successful!'),
        duration: Duration(seconds: 2),
      ),
    );
    // Navigate back to the login screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // registration UI here
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Container(
        // registration content
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                handleRegistration(context);
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    ));
  }
}
