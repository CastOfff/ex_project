
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  const LoginButton({super.key, required this.onPressed, required this.title});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFAD3F32),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minimumSize: const Size(500, 44),
          maximumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),)
    );
  }
}
