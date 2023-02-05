import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String text;
  final bool crypt;
  final ValueChanged<String> onchange;

  const AuthField({super.key, required this.text, required this.crypt, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: TextField(
        obscureText: crypt,
        onChanged: onchange,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(192, 125, 84, 26),
          hintText: text,
          hintStyle: const TextStyle(
              fontSize: 13, color: Color.fromARGB(179, 220, 220, 220)),
        ),
      ),
    );
  }
}
