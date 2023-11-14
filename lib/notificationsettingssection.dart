import 'package:flutter/material.dart';

class NotificationSettingsSection extends StatefulWidget {
  @override
  _NotificationSettingsSectionState createState() =>
      _NotificationSettingsSectionState();
}

class _NotificationSettingsSectionState
    extends State<NotificationSettingsSection> {
  bool receiveNotifications = true;

  @override
  Widget build(BuildContext context) {
    // UI and logic fro notification settings section
    return Container(
      //notification content here
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notification Settings',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Text('Receive Notifications'),
              const Spacer(),
              Switch(
                value: receiveNotifications,
                onChanged: (value) {
                  setState(() {
                    receiveNotifications = value;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Notification settings updated!',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                activeColor: Colors.deepPurpleAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
