import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:trackizer/core/constants/app_colors.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final List<BoxShadow>? boxShadow;
  final String? imagePath;

  final double width;
  final double height;
  final VoidCallback onPressed;
  final Color textColor;
  final String? svgAssetPath;
  final double? svgSize;

  const GradientButton({
    super.key,
    this.imagePath,
    required this.text,
    this.gradientColors = const [Color(0xffffA726), Color(0xffFF7F37)],
    this.boxShadow,
    this.width = 324,
    this.height = 48,
    required this.onPressed,
    this.textColor = AppColors.myWhite,
    this.svgAssetPath,
    this.svgSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(999),
          boxShadow: [
            BoxShadow(
              color: gradientColors.first.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 12,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (svgAssetPath != null) ...[
                SvgPicture.asset(
                  svgAssetPath!,
                  width: svgSize,
                  height: svgSize,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
