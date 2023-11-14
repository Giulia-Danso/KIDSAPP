import 'package:flutter/material.dart';
import 'profilesection.dart';
import 'passwordchangesection.dart';
import 'notificationsettingssection.dart';
import 'logoutbutton.dart';

class AccountSettingsScreen extends StatefulWidget {
  @override
  _AccountSettingsScreenState createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Account Settings'),
      ),
      body: Column(
        children: [
          ProfileSection(),
          PasswordChangeSection(),
          NotificationSettingsSection(),
          LogoutButton(),
        ],
      ),
    );
  }
}
