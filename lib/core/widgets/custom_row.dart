import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';

class CustomRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;
  final VoidCallback? onTap;
  final MainAxisAlignment alignment;
  final bool highlightValue;

  const CustomRow({
    super.key,
    required this.label,
    required this.value,
    this.icon = Icons.chevron_right,
    this.onTap,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.highlightValue = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        AppText(text: label, fontSize: 14),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Container(
                color: highlightValue
                    ? AppColors.myText
                    : Colors.transparent,
                child: Row(
                  children: [
                    AppText(text: value, fontSize: 12,color: AppColors.myHeaderText,),
                    if (icon != null) ...[
                      SizedBox(width: 8),
                      Icon(icon, size: 16, color: AppColors.myHeaderText),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
