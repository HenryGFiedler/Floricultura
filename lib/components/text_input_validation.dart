import 'package:flutter/material.dart';

class TextInputValidation extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const TextInputValidation({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          labelText: hintText,
          contentPadding: const EdgeInsets.all(12),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          errorStyle: TextStyle(
              color: Colors.red.shade900,
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              shadows: [
                Shadow(offset: Offset(-0.1, -0.1), color: Colors.black),
                Shadow(offset: Offset(0.1, -0.1), color: Colors.black),
                Shadow(offset: Offset(-0.1, 0.1), color: Colors.black),
                Shadow(offset: Offset(0.1, 0.1), color: Colors.black),
              ]
          ),
      ),
      validator: validator,
    );
  }
}
