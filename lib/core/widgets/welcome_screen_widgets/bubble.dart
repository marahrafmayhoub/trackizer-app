import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bubble extends StatelessWidget {
  final Alignment alignment;
  final Offset offset;
  final double? angle; // زاوية الدوران بالراديان (اختياري)
  final String imagePath;
  final double? width;
  final double? height;

  const Bubble({
    super.key,
    required this.alignment,
    required this.offset,
    this.angle, // optional
    required this.imagePath,
    this.width = 288,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = Image.asset(
      imagePath,
      width: width,
      height: height,
    );

    if (angle != null) {
      imageWidget = Transform.rotate(
        angle: angle!,
        child: imageWidget,
      );
    }

    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: imageWidget,
      ),
    );
  }
}
