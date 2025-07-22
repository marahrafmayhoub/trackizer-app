import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

class CustomCard extends StatelessWidget {
  final double rotationDegree; // الزاوية بالدرجات
  final Offset offset;
  final Color color;
  final double width=232;
  final double height=349;
  final BorderRadius? borderRadius;

  const CustomCard({
    super.key,
    required this.rotationDegree,
    required this.offset,
    required this.color,
    // this.width = 232,
    // this.height = 349,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationDegree * (pi / 180),
      child: Transform.translate(
        offset: Offset(offset.dx.w, offset.dy.h),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            color: color,
          ),
        ),
      ),
    );
  }
}
