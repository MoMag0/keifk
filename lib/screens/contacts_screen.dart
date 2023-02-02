import 'package:flutter/material.dart';

import '../database/colors.dart';
import '../widgets/contact_screen_components/contacts_view.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 61,
          backgroundColor: appBarColor,
          elevation: 0,
          title: const Text(
            'Kaif Halik',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          actions: [
            // search icon
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white, size: 28),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 4,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: const ContactsView(isMobile: true),
      ),
    );
  }
}
