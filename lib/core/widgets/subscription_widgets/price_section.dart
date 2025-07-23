
  import 'package:flutter/material.dart';

Widget buildLogoBox(String path, double screenWidth) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset(
        path,
        width: screenWidth * 0.2,
        height: screenWidth * 0.2,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget buildPriceButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff4E4E61).withOpacity(0.2),
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: Color(0xff4E4E61), size: 40),
        onPressed: onPressed,
      ),
    );
  }