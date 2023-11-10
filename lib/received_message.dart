import 'package:flutter/material.dart';
import 'package:kidsapp/receivedmessagelist.dart';

import 'individualmessagescreen.dart';

class MessageWidget extends StatelessWidget {
  final ReceivedMessage message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _navigateToIndividualMessage(context, message);
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage(message.profilePicture),
      ),
      title: Row(
        children: [
          Text(message.senderName),
          const SizedBox(width: 8.0),
          const Text(
            '12:34 PM, Nov 10',
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
        ],
      ),
      subtitle: Text(message.message),
    );
  }

  void _navigateToIndividualMessage(
      BuildContext context, ReceivedMessage message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => IndividualMessageScreen(message: message),
      ),
    );
  }
}
