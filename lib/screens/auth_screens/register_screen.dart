import 'package:flutter/material.dart';
import '../../Widgets/auth_components/auth_button.dart';
import '../../widgets/auth_components/auth_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../user_screens/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // create the auth object that we will use its methods later to authintacte
  final _auth = FirebaseAuth.instance;

  // define input field for login page
  late String email;
  late String password;

  // to know weitehr the app is loading to get user data from firebase
  bool _isInAsyncCall = false;
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
            //the register components
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
                    //lApp ogo
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
                    // register  button < with visiting firebase >
                    AuthButton(
                        theFunction: () async {
                          try {
                            setState(() {
                              // activite async bool , due to searching process in firebase
                              _isInAsyncCall = true;
                            });
                            // await for _auth object to create the user with given arguments

                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                            );
                            setState(() {
                              // end of process ? close loading widget
                              _isInAsyncCall = false;
                            });
                          } catch (e) {
                            setState(() {
                              // even if there error, close the widget put dont push to main page
                              _isInAsyncCall = false;
                            });
                            print(e);
                          }
                        },
                        text: 'Sign Up'),
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
