import 'package:flutter/material.dart';

import '../../Widgets/auth_components/auth_button.dart';
import '../../widgets/auth_components/auth_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../user_screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // store firebase authentication object < to use its method later on >
  final _auth = FirebaseAuth.instance;

  // to know weitehr the app is loading to get user data from firebase
  bool _isInAsyncCall = false;

  // define input field for login page
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    // we start with stack to make a wallpaper theme
    return Stack(
      children: [
        // most back on stack < wallpaper >
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
        // Scaffold to put login page components
        Scaffold(
          // transparent to make wallpaper on most back appears.
          backgroundColor: Colors.transparent,
          //To use loading circle, we should make it upper or father of page components
          body: ModalProgressHUD(
            inAsyncCall:
                _isInAsyncCall, // make it appears while async true. 'in getting messages mode'
            opacity: 0.5,
            progressIndicator: const CircularProgressIndicator(),

            //the login components
            child: ListView(
              // listview to make it error prone when open keyboard
              children: [
                const SizedBox(
                  height: 70,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //App Logo
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const Image(
                          image: AssetImage("assets/kaifhaliklogo.png"),
                        ),
                      ),
                    ),
                    // email text field
                    AuthField(
                      text: 'Enter your email',
                      crypt: false,
                      onchange: (value) {
                        email = value;
                      },
                    ),
                    // Password text field
                    AuthField(
                      text: 'Enter your passowrd',
                      crypt: true,
                      onchange: (value) {
                        password = value;
                      },
                    ),
                    // Sign in button < with visiting firebase >
                    AuthButton(
                        theFunction: () async {
                          try {
                            setState(() {
                              // activite async bool , due to searching process in firebase
                              _isInAsyncCall = true;
                            });
                            // await for _auth object to search for user with given arguments
                            // if found ? store user instance into user variable
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);
                            // ignore: unnecessary_null_comparison
                            if (user != null) {
                              // here to check if user is found
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                // if found, go to main user page
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            }
                          } catch (e) {
                            // if not, just stop and print reason
                            setState(() {
                              _isInAsyncCall = false;
                            });
                            print(e);
                          }
                        },
                        text: 'Sign In'),
                    // back to welcome page
                    AuthButton(
                        theFunction: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Back'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
