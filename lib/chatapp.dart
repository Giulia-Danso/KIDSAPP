import 'package:flutter/material.dart';
import 'package:kidsapp/chat_screen.dart' as ChatScreenPage;
import 'package:kidsapp/loginpage.dart';
import 'package:kidsapp/settingsscreen.dart';
import 'contact_list.dart' as ContactListPage;

class ChatApp extends StatefulWidget {
  ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Material(child: LoginScreen()),
    Material(child: ChatScreenPage.ChatScreen()),
    Material(child: ContactListPage.ContactList()),
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
      body: _selectedIndex < _screens.length
          ? _screens[_selectedIndex]
          : Container(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Log In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers_outlined),
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
