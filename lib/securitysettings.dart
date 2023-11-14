import 'package:flutter/material.dart';
import 'twofactorauthenticationsection.dart';
import 'settingsscreen.dart';

class SecuritySettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Security Settings'),
      ),
      body: Column(
        children: [
          TwoFactorAuthenticationSection(),
          // can add more security related widgets as needed
        ],
      ),
    );
  }
}
