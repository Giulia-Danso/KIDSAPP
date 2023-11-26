import 'chatapp.dart';
import 'loginpage.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  void handleResetPassword() {
    String email = emailController.text.trim();
    String newPassword = newPasswordController.text;
    String repeatPassword = repeatPasswordController.text;

    print('Reset Password :$email');
    print('New Password: $newPasswordController');
    print('RepeatPassword: $repeatPasswordController');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your Email and new Password to reset your password',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Enter Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 209, 207, 207),
                contentPadding: const EdgeInsets.all(16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: newPasswordController,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Enter New Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 209, 207, 207),
                  contentPadding: const EdgeInsets.all(16.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.deepPurpleAccent),
                    borderRadius: BorderRadius.circular(8.0),
                  )),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: repeatPasswordController,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Repeat Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 209, 207, 207),
                contentPadding: const EdgeInsets.all(16.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: const TextStyle(
                fontFamily: 'Nunito',
                fontSize: 13.0,
              ),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                handleResetPassword();
                // Provide feedback to the user (confirmation message)
              },
              child: const Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
