import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const customButton({
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
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        backgroundColor: Color(0xffFFFFFF).withOpacity(0.1),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
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
