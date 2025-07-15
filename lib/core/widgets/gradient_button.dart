import 'package:flutter/material.dart';

class gradientButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const gradientButton({
    Key? key,
    required this.text,
    this.gradientColors = const [Color(0xffffA726), Color(0xffff6D00)],
    this.width = 324,
    this.height = 48,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        backgroundColor: Colors.transparent,
        minimumSize: Size(width, height), // تحديد العرض والارتفاع إذا لزم الأمر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ), // لجعل الخلفية شفافة لاستخدام gradient
        elevation: 0, // إزالة الظل الافتراضي
        shadowColor: Colors.transparent, // إزالة لون الظل
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.orangeAccent.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
