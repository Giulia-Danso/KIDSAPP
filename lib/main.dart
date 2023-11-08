import 'package:flutter/material.dart';
import 'chatscreen.dart';
import 'settingsscreen.dart';
import 'contact.dart';

void main() {
  runApp(const MaterialApp(
    home: ChatApp(),
  ));
}

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    ChatTab(),
    const Center(
      child: Text('Call History'),
    ),
    CallsScreen(callHistory: callHistory),
  ];

  void openSettingsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KidsApp'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              openSettingsPage(context);
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your contact list UI
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phoneNumber),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  //phone button click here
                },
              ),
              IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(contact: contact),
                    ),
                  );
                },
              ),
            ],
          ),
          onTap: () {},
        );
      },
    );
  }
}

class CallsScreen extends StatelessWidget {
  final List<CallHistory> callHistory;

  CallsScreen({required this.callHistory});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callHistory.length,
      itemBuilder: (context, index) {
        final call = callHistory[index];
        return ListTile(
          title: Text(call.contactName),
          subtitle: Text('Call Time: ${call.callTime}'),
        );
      },
    );
  }
}

class ChatTab extends StatefulWidget {
  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final List<String> messages = [];
  final TextEditingController messageController = TextEditingController();

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages
                  .map((message) => ListTile(title: Text(message)))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage(messageController.text);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
