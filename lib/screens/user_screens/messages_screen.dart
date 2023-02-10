import 'package:flutter/material.dart';
import 'package:keifk/widgets/messages_screen_components/his_message_card.dart';
import 'package:keifk/widgets/messages_screen_components/input_message_field.dart';
import 'package:keifk/widgets/messages_screen_components/my_message_card.dart';

import '../../database/colors.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesScreen extends StatefulWidget {
  final String groupName;
  final String groupPhoto;
  const MessagesScreen(
      {super.key, required this.groupName, required this.groupPhoto});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // create firebase to initiate 'sender' with its messages
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User loginUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  //to recognize user
  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loginUser = user;
        print(loginUser.email);
        print("has entered the chat sceeen");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width * 0.251,
        leading: Expanded(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(widget.groupPhoto),
                radius: 20,
              ),
            ],
          ),
        ),
        title: Text(
            widget.groupName), //will replaced with reciever mail inshaAllah
        //centerTitle: true,
        backgroundColor: appBarColor,
        // end of chat profile bar icons
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.video_call,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.84,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/welcomewallpaper.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Expanded(
              child: ListView(
                //shrinkWrap: true,
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: _firestore.collection('messages').snapshots(),
                    builder: (context, snapshot) {
                      List<Widget> messageWidgets = [];

                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final messages = snapshot.data!.docs;
                      for (var message in messages) {
                        if (message.get('sender') == loginUser.email) {
                          if (message.get('text') != null) {
                            messageWidgets.add(
                              MyMessageCard(
                                  myText: message.get('text'),
                                  myMail: loginUser.email!),
                            );
                          }
                        } else {
                          messageWidgets.add(HisMessageCard(
                              hisText: message.get('text'),
                              hisMail: message.get('sender')));
                        }
                      }
                      return Column(
                        children: messageWidgets,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          InputMessegeField(
            userMail: loginUser,
          ),
        ],
      ),
    );
  }
}
