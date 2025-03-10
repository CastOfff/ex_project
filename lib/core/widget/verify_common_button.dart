
import 'package:flutter/material.dart';

class VerifyCommonButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  const VerifyCommonButton({super.key, required this.onPressed, required this.title});

  @override
  State<VerifyCommonButton> createState() => _VerifyCommonButtonState();
}

class _VerifyCommonButtonState extends State<VerifyCommonButton> {

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
        child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),)
    );
  }
}
