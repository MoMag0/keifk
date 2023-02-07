import 'package:flutter/material.dart';

import '../database/colors.dart';
import '../widgets/chat_screen_components/input_message_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  //chat bar reviever information
  final String userName;
  final String userPhoto;
  const ChatScreen(
      {super.key, required this.userName, required this.userPhoto});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                  backgroundImage: NetworkImage(widget.userPhoto),
                  radius: 20,
                ),
              ],
            ),
          ),
          title: Text(
              widget.userName), //will replaced with reciever mail inshaAllah
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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backgroundImage.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore.collection('messages').snapshots(),
                  builder: (context, snapshot) {
                    List<Text> messageWidgets = [];

                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final messages = snapshot.data!.docs;
                    for (var message in messages) {
                      final messageText = message.get('text');
                      final messageSender = message.get('sender');
                      final messageWidget =
                          Text('$messageSender: $messageText');
                      messageWidgets.add(messageWidget);
                    }

                    return Column(
                      children: messageWidgets,
                    );
                  },
                ),
              ),
              //const ChatView(),
              InputMessegeField(
                userMail: loginUser,
              ),
            ],
          ),
        ));
  }
}
