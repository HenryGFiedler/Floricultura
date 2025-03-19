import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool adaptiveWidth;
  final double? height;
  final double? fontSize;
  final IconData? icon;

  const MainButton({
    super.key,
    this.text,
    required this.onPressed,
    this.color,
    this.adaptiveWidth = false,
    this.height,
    this.fontSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: adaptiveWidth ? null : double.infinity,
      height: height ?? 50,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color ?? Color(0xfffcafbb),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize ?? 25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (icon != null) Icon(icon, size: 25, color: Colors.white),
              Text(text ?? ''),
            ],
          ),
        ),
      ),
    );
  }
}
