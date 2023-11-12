import 'package:flutter/material.dart';
import 'received_message.dart';

class IndividualMessageScreen extends StatelessWidget {
  final ReceivedMessage message;

  IndividualMessageScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message.senderName),
      ),
      body: Center(
        child: Text(message.message),
      ),
    );
  }
}

void _handleMessageTap(BuildContext context, ReceivedMessage message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reply to ${message.senderName}'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Type your reply...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Send'),
          ),
        ],
      );
    },
  );
}
