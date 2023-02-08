import 'package:flutter/material.dart';

import '../../database/colors.dart';
import '../../database/info.dart';
import '../../screens/chat_screen.dart';

class ContactsView extends StatelessWidget {
  final bool isMobile;
  const ContactsView({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: info.length,
      itemBuilder: (context, int index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                if (isMobile) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        groupName: info[index]['name'].toString(),
                        groupPhoto: info[index]['profilePic'].toString(),
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: ListTile(
                  title: Text(info[index]['name'].toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          color: appBarColor,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text(info[index]['message'].toString(),
                      style: const TextStyle(fontSize: 15, color: appBarColor)),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(info[index]['profilePic'].toString()),
                    radius: 30,
                  ),
                  trailing: Text(info[index]['time'].toString(),
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black)),
                ),
              ),
            ),
            const Divider(
              color: dividerColor,
              indent: 85,
            ),
          ],
        );
      },
    );
  }
}
