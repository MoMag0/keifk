import 'package:flutter/material.dart';
import 'package:keifk/screens/register_screen.dart';

import '../Widgets/auth_components/auth_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          body: Column(
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
              // Sign in button
              AuthButton(
                  theFunction: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  text: 'Sign In'),

              // Sign up button
              AuthButton(
                  theFunction: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  text: 'Sign Up'),
            ],
          ),
        ),
      ],
    );
  }
}
