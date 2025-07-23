import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';

class AddCardButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;
  final VoidCallback onTap;
  final String iconAssetPath;
  final double borderRadius;
  final List<double> dashPattern;
  final Color borderColor;
  final Color textColor;
  final EdgeInsetsGeometry? textPadding;

  const AddCardButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 328,
     this.height = 52,
    this.fontSize = 14,
    this.iconAssetPath = 'assets/images/credit_card_screen_images/add.svg',
    this.borderRadius = 16,
    this.dashPattern = const [4, 4],
    this.borderColor = const Color(0xff4E4E61),
    this.textColor = AppColors.myHeaderText,
    this.textPadding,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(borderRadius),
        color: borderColor,
        dashPattern: dashPattern,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: Container(
          width: width.w,
          height: height.h,
          alignment: Alignment.center,
          child: Padding(
            padding: textPadding ?? EdgeInsets.zero, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: text,
                  fontSize: fontSize.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset(iconAssetPath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
