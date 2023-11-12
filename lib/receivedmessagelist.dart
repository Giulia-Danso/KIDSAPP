import 'package:flutter/material.dart';
import 'received_message.dart';
import 'individualmessagescreen.dart';

class ReceivedMessageList extends StatelessWidget {
  final List<ReceivedMessage> messages;
  final void Function(ReceivedMessage message) onMessageTap;

  ReceivedMessageList({
    required this.messages,
    required this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ReceivedMessageWidget(
          message: messages[index],
          onMessageTap: () => onMessageTap(messages[index]),
        );
      },
    );
  }
}

class ReceivedMessageWidget extends StatelessWidget {
  final ReceivedMessage message;
  final VoidCallback onMessageTap;

  ReceivedMessageWidget({required this.message, required this.onMessageTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(message.profilePictureUrl),
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
