import 'package:floricultura/screens/login_screen.dart';
import 'package:flutter/material.dart';

class BootScreen extends StatelessWidget {
  const BootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });

    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0xB8F87C8A)),
      child: Stack(
        children: [
          Center(
            child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(
              child: Text(
                "Flores",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
