import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleCard extends StatelessWidget {
  final double width;
  final double height;
  final double opacity;
  final double top;
  final double left;
  final Color color;

  const CircleCard({
    super.key,
    required this.width,
    required this.height,
    required this.opacity,
    required this.top,
    required this.left,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top.h,
      left: left.w,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(opacity),
        ),
      ),
    );
  }
}
