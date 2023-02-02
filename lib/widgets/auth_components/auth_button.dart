import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;

  final Function() theFunction;
  const AuthButton({
    super.key,
    required this.text,
    required this.theFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        color: const Color.fromARGB(163, 141, 85, 6),
        child: MaterialButton(
          onPressed: theFunction,
          child: Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
