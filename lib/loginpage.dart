import 'package:kidsapp/forgotpassword.dart';
import 'package:kidsapp/profilepage.dart';
import 'package:kidsapp/registration.dart';

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
          builder: (context) => const ProfilePage(
            username: '',
          ),
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
            Image.asset(
              'lib/images/KidsApp_logo.png',
              width: 250.0,
              height: 250.0,
              fit: BoxFit.contain,
            ),
            TextField(
              controller: usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Enter Username',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide:
                      BorderSide(color: Colors.grey[400]!), // Set border color
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 209, 207, 207),
                contentPadding: const EdgeInsets.all(16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                alignLabelWithHint: true,
              ),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Enter Password',
                prefixIcon: const Icon(Icons.key),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 209, 207, 207),
                contentPadding: const EdgeInsets.all(16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.purpleAccent),
                  borderRadius: BorderRadius.circular(7.0),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purpleAccent),
                ),
                alignLabelWithHint: true,
              ),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                handleLogin(context);
                print('Login button pressed');
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                //handle forgot password
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPasswordScreen(),
                  ),
                );
              },
              child: const Text(
                'Dont Remember Password? Click here',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
