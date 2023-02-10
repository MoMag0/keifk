import 'package:flutter/material.dart';

import '../../database/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InputMessegeField extends StatelessWidget {
  final User userMail;
  final textFieldController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  void getMessagesStresam() async {
    // this method used to push messages automateculy from firestore :) >
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  InputMessegeField({
    super.key,
    required this.userMail,
  });

  String? userMessage;
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.07,
      color: chatBarMessage,

      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: dividerColor),
              ),
            ),
            child: TextField(
              controller: textFieldController,
              onChanged: (value) {
                userMessage = value;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: false,
                fillColor: searchBarColor,
                hintText: 'Type a message',
                focusColor: Colors.white,
                hintStyle: const TextStyle(fontSize: 13, color: Colors.white),
                prefixIcon: const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.white60,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _firestore.collection('messages').add(
                      {
                        'text': userMessage,
                        'sender': userMail.email,
                      },
                    );
                    getMessagesStresam();
                    textFieldController.clear();
                  },
                  icon: const Icon(Icons.send, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
