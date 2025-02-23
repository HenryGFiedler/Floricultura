import 'package:flutter/material.dart';

class TextInputValidation extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const TextInputValidation({
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hintText,
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(12),
      ),
      validator: validator,
    );
  }
}