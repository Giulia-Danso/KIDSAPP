import 'package:flutter/material.dart';

class PasswordChangeSection extends StatelessWidget {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // UI logic here
    return Container(
      //password change section content here
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Change Password',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: currentPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Current Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: confirmNewPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm New Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              //changing password
              String currentPassword = currentPasswordController.text.trim();
              String newPassword = newPasswordController.text.trim();
              String confirmPassword = confirmNewPasswordController.text.trim();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password changed successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
            ),
            child: const Text('Change Password'),
          ),
        ],
      ),
    );
  }
}
