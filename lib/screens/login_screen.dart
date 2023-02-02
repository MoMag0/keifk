import 'package:flutter/material.dart';

import '../Widgets/auth_components/auth_button.dart';
import '../widgets/auth_components/auth_field.dart';
import 'contacts_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  const AuthField(text: 'Enter your email'),
                  const AuthField(text: 'Enter your passowrd'),
                  // Sign in button
                  AuthButton(
                      theFunction: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ContactsScreen(),
                          ),
                        );
                      },
                      text: 'Sign In'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
