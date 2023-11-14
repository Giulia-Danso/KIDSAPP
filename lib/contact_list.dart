import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<String> contacts = ['Whitney', 'Christabel', 'Mamma'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(contacts[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(contactName: contacts[index]),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String contactName;

  ChatScreen({required this.contactName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _replyController = TextEditingController();
  final List<String> _messages = ['Hello!', 'How are you?'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Chat with ${widget.contactName}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _replyController,
                    decoration: const InputDecoration(
                      hintText: 'Type your reply...',
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
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String reply = _replyController.text.trim();
    if (reply.isNotEmpty) {
      setState(() {
        _messages.add(reply);
        _replyController.clear();
      });
    }
  }

  void main() {
    runApp(
      MaterialApp(
        home: ChatScreen(contactName: 'ExampleContact'),
      ),
    );
  }
}
