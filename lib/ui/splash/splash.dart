import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: _buildBodyPage(),
      ),
    );
  }
}

Widget _buildBodyPage() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconSplash(),
        _buildTextSplash(),
      ],
    ),
  );
}

Widget _buildIconSplash() {
  return Image.asset(
    "assets/images/splash_icon.png",
    width: 95,
    height: 80,
    fit: BoxFit.contain,
  );
}

Widget _buildTextSplash() {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: const Text(
      "UpTodo",
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
