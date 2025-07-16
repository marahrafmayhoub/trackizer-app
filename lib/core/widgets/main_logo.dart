import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class mainLogo extends StatelessWidget {
  final double width;
  final double height;
  const mainLogo({
    Key? key,
    this.width = 178, 
    this.height = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: width.w,
      height: height.h,
    );
  }
}
