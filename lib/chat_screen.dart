import 'package:flutter/material.dart';
import 'package:kidsapp/received_message.dart';
import 'package:kidsapp/receivedmessagelist.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChatScreen(),
    ),
  );
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ReceivedMessage> _messages = [
    ReceivedMessage(
      senderName: 'Christabel',
      message: 'Hey how are you?',
      profilePictureUrl:
          'https://images.pexels.com/photos/2250276/pexels-photo-2250276.jpeg?cs=srgb&dl=pexels-fillipe-gomes-2250276.jpg&fm=jpg&_gl=1*69p5qi*_ga*MTgwMDI2ODU5NC4xNjg3Njg4MTk4*_ga_8JE65Q40S6*MTY5OTYzNjkwOS4yMi4xLjE2OTk2MzcwMTYuMC4wLjA.',
    ),
    ReceivedMessage(
      senderName: 'Whitney',
      message: 'what´s time are you coming',
      profilePictureUrl:
          'https://images.pexels.com/photos/207983/pexels-photo-207983.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    ReceivedMessage(
      senderName: 'Mommy',
      message: 'Hello Darling',
      profilePictureUrl:
          'https://images.pexels.com/photos/1888614/pexels-photo-1888614.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
  ];

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
                child: const Text('Send'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReceivedMessageList(
              messages: _messages,
              onMessageTap: (message) => _handleMessageTap(context, message),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      ReceivedMessage newMessage = ReceivedMessage(
        senderName: 'Me',
        message: messageText,
        profilePictureUrl:
            'https://images.pexels.com/photos/6898856/pexels-photo-6898856.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      );

      setState(() {
        _messages.add(newMessage);
        _messageController.clear();
      });
    }
  }
}
