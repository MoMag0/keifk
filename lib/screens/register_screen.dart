import 'package:flutter/material.dart';
import '../Widgets/auth_components/auth_button.dart';
import '../widgets/auth_components/auth_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'contacts_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // create the auth object that we will use its methods later to authintacte
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          // wallpaper
          child: Container(
            child: Image.asset(
              "assets/welcomewallpaper.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //logo
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: const Image(
                        image: AssetImage("assets/kaifhaliklogo.png"),
                      ),
                    ),
                  ),
                  AuthField(
                    text: 'Enter your email',
                    crypt: false,
                    onchange: (value) {
                      email = value;
                    },
                  ),
                  AuthField(
                    text: 'Enter your passowrd',
                    crypt: true,
                    onchange: (value) {
                      password = value;
                    },
                  ),
                  // Sign in button
                  AuthButton(
                      theFunction: () async {
                        try {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ContactsScreen(),
                            ),
                          );
                        } catch (e) {
                          print(e);
                        }
                      },
                      text: 'Sign Up'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
