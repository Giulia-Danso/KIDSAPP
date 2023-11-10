import 'package:flutter/material.dart';

import 'package:kidsapp/receivedmessagelist.dart';

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
