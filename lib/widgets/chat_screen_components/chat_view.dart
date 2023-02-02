import 'package:flutter/material.dart';

import '../../database/info.dart';
import 'his_message_card.dart';
import 'my_message_card.dart';


class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, int index) {
          if (messages[index]['isMe'] == true) {
            return MyMessageCard(
                myText: messages[index]['text'].toString(),
                myTime: messages[index]['time'].toString());
          }
          return HisMessageCard(
            hisText: messages[index]['text'].toString(),
            hisTime: messages[index]['time'].toString(),
          );
        },
      ),
    );
  }
}
