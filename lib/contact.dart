import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'chatscreen.dart';

class ContactList extends StatelessWidget {
  ContactList({super.key});

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
                icon: Icon(Icons.phone),
                onPressed: () {},
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

class CallHistory {
  final String contactName;
  final DateTime callTime;

  CallHistory(this.contactName, this.callTime);
}

final List<CallHistory> callHistory = [];

void addCalltoHistory(String contactName) {
  final callTime = DateTime.now();
  final call = CallHistory(contactName, callTime);
  callHistory.add(call);
}

class Contact {
  final String name;
  final String phoneNumber;
  Contact(this.name, this.phoneNumber);
}

final List<Contact> contacts = [
  Contact('Christabel', '+4915211351863'),
  Contact('Whitney', '+49123456789'),
  Contact('Giulia', '+9876543121'),
  Contact('Mamma', '+490012345544'),
];
