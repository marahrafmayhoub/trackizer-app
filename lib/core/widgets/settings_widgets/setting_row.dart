import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

Widget buildSettingRow(
    String title, {
    String? trailing,
    bool isSwitch = false,
    String? imageAsset,
    VoidCallback? onTap,
  }) {
    final content = Row(
      children: [
        if (imageAsset != null)
          Image.asset(
            imageAsset,
            width: 24,
            height: 24,
            color: AppColors.myIcon,
          ),
        if (imageAsset != null) const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.myWhite,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
        isSwitch
            ? Switch(
                value: false,
                onChanged: (val) {},
                activeColor: AppColors.myIcon,
              )
            : Text(
                trailing ?? '',
                style: const TextStyle(
                  color: AppColors.myIcon,
                  fontWeight: FontWeight.w500,
                ),
              ),
        const SizedBox(width: 4),
        if (!isSwitch)
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
            color: AppColors.myGrey,
          ),
      ],
    );

    return isSwitch
        ? GestureDetector(onTap: onTap, child: content)
        : InkWell(onTap: onTap, child: content);
  }
