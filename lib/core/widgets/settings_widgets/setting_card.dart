import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/widgets/app_text.dart';

 Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppText(text: title, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget buildSettingsCard(List<Widget> children) {
    return Container(
      width: 328.w,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xff4E4E61).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children
            .map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }

