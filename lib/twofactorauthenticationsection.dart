import 'package:flutter/material.dart';
import 'securitysettings.dart';

class TwoFactorAuthenticationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Two-Factor Authentication'),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Two-Factor Authentication Settings'),
              content: const Text('Placeholder for 2FA settings'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
