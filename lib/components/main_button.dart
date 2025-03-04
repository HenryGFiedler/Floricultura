import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const MainButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Color(0xfffcafbb),
            foregroundColor: Colors.white,
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
            ),
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
