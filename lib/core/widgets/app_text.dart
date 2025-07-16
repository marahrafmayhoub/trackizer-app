import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class appText extends StatelessWidget {

 final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;


  const appText({
   Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.myWhite,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize.sp,
      ),
    );
  }
}

