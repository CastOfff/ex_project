import 'package:flutter/material.dart';

import '../../../../../core/constants/color.dart';

class ActionButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  final double width;
  final double height;
  final Icon icon;
  final BorderRadius? borderRadius;

  const ActionButton({super.key,
    required this.onPressed,
    required this.title,
    required this.icon,
    this.width = 326,
    this.height = 45, this.borderRadius});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: primaryColor,
          minimumSize: Size(widget.width, widget.height),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(0)),
          ),
        ),
        child: Row(
          children: [
            widget.icon,
            const SizedBox(width: 20,),
            Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),)
          ],
        )
    );
  }
}
