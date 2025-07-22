import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.myGrey,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      color: AppColors.myGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const SizedBox(height: 32),

              // Profile Section
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("assets/images/Avatar.png"),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        color: AppColors.myWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "j.doe@gmail.com",
                      style: TextStyle(color: AppColors.myGrey),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.myBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        "Edit profile",
                        style: TextStyle(color: AppColors.myWhite),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // General Section
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

              // My Subscriptions Section
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

              // Appearance Section
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

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.myWhite,
        ),
      ),
    );
  }

  Widget buildSettingsCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.myBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children:
            children
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
            color: AppColors.myGrey,
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
              activeColor: AppColors.myGrey,
            )
            : Text(
              trailing ?? '',
              style: const TextStyle(
                color: AppColors.myGrey,
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
}
