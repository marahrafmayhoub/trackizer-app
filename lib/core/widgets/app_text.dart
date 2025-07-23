import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:trackizer_ui/core/constants/app_colors.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
=======
import 'package:trackizer/core/constants/app_colors.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/core/constants/app_colors.dart';
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
<<<<<<< HEAD
  final FontStyle fontstyle;
=======
  final FontStyle fontStyle;

>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d
  const AppText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.myWhite,
    this.textAlign = TextAlign.start,
<<<<<<< HEAD
    this.fontstyle = FontStyle.normal,
=======
    this.fontStyle = FontStyle.normal,
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        fontWeight: fontWeight,
        color: color,
<<<<<<< HEAD
        fontSize: fontSize.sp,
        fontStyle: fontstyle,
=======
        fontSize: fontSize.sp,fontStyle: fontStyle
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d
      ),
    );
  }
}
