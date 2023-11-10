import 'package:flutter/material.dart';
import 'received_message.dart';

class ReceivedMessage {
  final String senderName;
  final String message;
  final String profilePicture;

  ReceivedMessage({
    required this.senderName,
    required this.message,
    required this.profilePicture,
  });
}

class ReceivedMessageList extends StatelessWidget {
  final List<ReceivedMessage> messages;

  ReceivedMessageList(
      {required this.messages,
      required void Function(dynamic context, dynamic message) onMessageTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ReceivedMessageWidget(message: messages[index]);
      },
    );
  }
}

class ReceivedMessageWidget extends StatelessWidget {
  final ReceivedMessage message;

  ReceivedMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
}
