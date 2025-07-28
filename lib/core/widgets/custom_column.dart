// info_column.dart
import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';

class InfoColumn extends StatelessWidget {
  final String title;
  final String subtitle;
  final double titleFontSize;
  final double subtitleFontSize;
  final Color? subtitleColor;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool showDot;

  const InfoColumn({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 20,
    this.subtitleFontSize = 12,
    this.subtitleColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Column(
          children: [
            AppText(
              text: title,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
            ),
            AppText(
              text: subtitle,
              fontWeight: FontWeight.w500,
              fontSize: subtitleFontSize,
              color: subtitleColor ?? AppColors.myText,
            ),
          ],
        ),

        // if (showDot) SizedBox(height: 27), // مسافة بسيطة
        if (showDot)
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF9900), // اللون البرتقالي
            ),
          ),
      ],
    );
  }
}
