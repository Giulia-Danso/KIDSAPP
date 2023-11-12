import 'package:flutter/material.dart';
import 'individualmessagescreen.dart';

class ReceivedMessage {
  final String senderName;
  final String message;
  final String profilePictureUrl;

  ReceivedMessage({
    required this.senderName,
    required this.message,
    required this.profilePictureUrl,
  });
}

class MessageWidget extends StatelessWidget {
  final ReceivedMessage message;
  final VoidCallback onMessageTap;

  MessageWidget({required this.message, required this.onMessageTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(message.profilePictureUrl),
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
