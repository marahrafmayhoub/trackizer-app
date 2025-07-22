import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:trackizer_ui/core/constants/app_colors.dart';

=======
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
>>>>>>> 0ef4417abefadcb8d98f6235cbc2cdacf1713428

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const AppText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.myWhite,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.inter(fontWeight: fontWeight,color: color,fontSize: fontSize.sp),
    
    );
  }
}
