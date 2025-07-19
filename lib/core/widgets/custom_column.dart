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

  const InfoColumn({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 20,
    this.subtitleFontSize = 12,
    this.subtitleColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        AppText(text: title, fontSize: titleFontSize),
        AppText(
          text: subtitle,
          fontSize: subtitleFontSize,
          color: subtitleColor ?? AppColors.myText,
        ),
      ],
    );
  }
}
