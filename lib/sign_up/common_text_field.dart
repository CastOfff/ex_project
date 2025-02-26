
import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final bool? obscureText;
  const CommonTextField({
    super.key,
      required this.controller,
      required this.focusNode,
      this.validator,
      this.keyboardType,
      required this.hintText,
      this.obscureText,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  //late final focusNode = FocusNode();
  late bool _obscureText;
  @override
  void initState() {
    // TODO: implement initState
    _obscureText = widget.obscureText ?? false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        widget.focusNode?.unfocus();
      },
      obscureText: _obscureText ?? false,
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
        suffixIcon: widget.obscureText == true ? IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility ,
            color: Colors.grey[400],
          ),
        ) : null,
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
