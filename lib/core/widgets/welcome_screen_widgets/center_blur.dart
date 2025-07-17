import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CenterGlow extends StatelessWidget {
  final double width;
  final double height;

  const CenterGlow({
    super.key,
    this.width = 220,
    this.height = 220,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100.h,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Colors.white.withOpacity(0.2),  
              Colors.transparent,       
            ],
            radius: 0.8,
          ),
        ),
      ),
    );
  }
}
