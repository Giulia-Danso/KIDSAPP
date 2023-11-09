import 'main.dart';
import 'package:flutter/material.dart';

// Define LoginScreen widget

// define Registration widget here
class RegistrationScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleRegistration(BuildContext context) {
    // Perform registration logic here
    //for simplicity, lets just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration successful!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // registration UI here
    return Container(
      // registration content
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Passwort',
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
    );
  }
}
