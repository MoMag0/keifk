import 'package:flutter/material.dart';

import '../Widgets/auth_components/auth_button.dart';
import '../widgets/auth_components/auth_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                      theFunction: () {
                        print(email);
                        print(password);
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
