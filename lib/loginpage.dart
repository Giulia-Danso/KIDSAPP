import 'package:kidsapp/registration.dart';
import 'chatapp.dart';
import 'package:flutter/material.dart';
// Define LoginScreen widget

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //LoginScreen({super.key});

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
          builder: (context) => ChatApp(),
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Login'),
      ),
      body: Padding(
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
                handleLogin(context);
                print('Login button pressed');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
