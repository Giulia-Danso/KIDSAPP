import 'package:flutter/material.dart';
import 'package:kidsapp/accountsettingsscreen.dart';
import 'package:kidsapp/securitysettings.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('Settings'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: Icon(Icons.account_balance_rounded),
              title: Text('Account Settings'),
              onTap: () {
                // add logic to handle accoount settings
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountSettingsScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Security Settings'),
              onTap: () {
                // add logic to handle security settings
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecuritySettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
