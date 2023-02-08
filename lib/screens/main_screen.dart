import 'package:flutter/material.dart';
import 'package:keifk/screens/welcome_screen.dart';

import '../database/colors.dart';
import '../widgets/main_page_components/contacts_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _auth = FirebaseAuth.instance;
  late User loginUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loginUser = user;
        print(loginUser.email);
        print(" login successfuly");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 61,
          backgroundColor: appBarColor,
          elevation: 0,
          title: Text(
            loginUser.email.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          actions: [
            // search icon
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white, size: 28),
            ),
            IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                );
              },
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
              Tab(text: 'GROUPS'),
              Tab(text: 'CHATS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        body: const ContactsView(isMobile: true),
      ),
    );
  }
}
