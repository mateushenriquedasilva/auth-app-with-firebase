import 'package:flutter/material.dart';

class MyTextfiled extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextfiled(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            prefixIcon: hintText == 'Email'
                ? const Icon(Icons.email_outlined)
                : const Icon(Icons.lock_outline),
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
