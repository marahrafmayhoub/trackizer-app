import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/settings_widgets/setting_card.dart';
import 'package:trackizer/core/widgets/settings_widgets/setting_row.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: HeaderWithIcons(
                  text: 'Settings',
                  textColor: AppColors.myHeaderText,
                  fontSize: 16.sp,
                  icons: [
                    HeaderIcon(
                      assetPath: 'assets/icons/header_icons/Back.svg',
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/Avatar.png"),
              ),
              const SizedBox(height: 8),
              AppText(
                text: "John Doe",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              // const SizedBox(height: 4),
              AppText(
                text: "j.doe@gmail.com",
                color: AppColors.myHeaderText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.myWhite.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const AppText(
                  text: "Edit profile",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    buildSectionTitle("General"),
                    buildSettingsCard([
                      buildSettingRow(
                        "Security",
                        trailing: "FaceID",
                        imageAsset: 'assets/images/FaceID.png',
                        onTap: () {},
                      ),
                      buildSettingRow(
                        "iCloud Sync",
                        isSwitch: true,
                        imageAsset: 'assets/images/iCloud.png',
                        onTap: () {},
                      ),
                    ]),
                    const SizedBox(height: 24),

                    buildSectionTitle("My subscriptions"),

                    buildSettingsCard([
                      buildSettingRow(
                        "Sorting",
                        trailing: "Date",
                        imageAsset: 'assets/images/Sorting.png',
                        onTap: () {},
                      ),
                      buildSettingRow(
                        "Summary",
                        trailing: "Average",
                        imageAsset: 'assets/images/Chart.png',
                        onTap: () {},
                      ),
                      buildSettingRow(
                        "Default currency",
                        trailing: "Syrian Pound (SP)",
                        imageAsset: 'assets/images/Money.png',
                        onTap: () {},
                      ),
                    ]),

                    const SizedBox(height: 24),
                    buildSectionTitle("Appearance"),
                    buildSettingsCard([
                      buildSettingRow(
                        "App icon",
                        trailing: "Default",
                        imageAsset: 'assets/images/App_icon.png',
                        onTap: () {},
                      ),
                      buildSettingRow(
                        "Theme",
                        trailing: "Dark",
                        imageAsset: 'assets/images/Light_theme.png',
                        onTap: () {},
                      ),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
