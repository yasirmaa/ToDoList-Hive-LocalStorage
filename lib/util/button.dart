import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color btnColor;

  const Button({super.key, required this.text, required this.onPressed, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: btnColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(text, style: const TextStyle(color: Colors.white),),
    );
  }
}
