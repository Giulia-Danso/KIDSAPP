import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  void handleLogout(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logout successful!'),
        duration: Duration(seconds: 2),
      ),
    );
//navigate back to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    // Implement the UI and logic for the logout button
    return Container(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          //handle logout logic

          handleLogout(context);
        },
        child: const Text('Logout'),
      ),
    );
  }
}
