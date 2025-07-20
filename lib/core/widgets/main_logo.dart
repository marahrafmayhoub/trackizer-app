import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainLogo extends StatelessWidget {
  final double width;
  final double height;
  const MainLogo({
    super.key,
    this.width = 178, 
    this.height = 29,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: width.w,
      height: height.h,
    );
  }
}
