
import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  const EditField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.validator,
    this.keyboardType,
    required this.hintText,
  });

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        widget.focusNode?.unfocus();
      },
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,),
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.edit, color: Colors.grey[400],),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 20,
          fontWeight: FontWeight.w400,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white)
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Màu viền khi có lỗi
        ),
      ),
    );
  }
}
