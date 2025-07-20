import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final double width=40;
  final double height=40;
  // final Color? color;

  const CustomIcon({
    super.key,
    required this.assetPath,
    // this.width = 40,
    // this.height = 40,
    // this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width.w,
      height: height.h,
      // color: color,
    );
  }
}
