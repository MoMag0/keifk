import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String text;
  const AuthField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: TextField(
        textAlign: TextAlign.center,
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(192, 227, 226, 226),
          hintText: text,
          hintStyle: const TextStyle(
              fontSize: 13, color: Color.fromARGB(179, 85, 85, 85)),
        ),
      ),
    );
  }
}
