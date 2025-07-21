import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
import 'package:trackizer/core/widgets/welcome_screen_widgets/bubble.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                        offset: Offset(0.w, 60.h),
                        child: mainLogo(),
                      ),
                    ),
                    Bubble(
                      alignment: Alignment.topLeft,
                      offset: Offset(-229.w, 120.h),
                      imagePath:
                          'assets/images/welcomeScreen_images/left_bubble.png',width: 288.w,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(0.w, 148.h),
                        child: SvgPicture.asset(
                          'assets/images/welcomeScreen_images/welcomeIcons.svg',
                          width: 289.w,
                          height: 410.h,
                        ),
                      ),
                    ),
                    Bubble(
                      alignment: Alignment.center,
                      offset: Offset(260.w, 430.h),
                      angle: -24.40,
                      width: 288.w,
                      imagePath:
                          'assets/images/welcomeScreen_images/left_bubble.png',
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Transform.translate(
                        offset: Offset(0.w, 202.67.h),
                        child: Image.asset(
                          'assets/images/welcomeScreen_images/blury.png',
                        ),
                      ),
                    ),            
                  ],
                ),
                SizedBox(height: 60.h),
                Column(
                  children: [
                    appText(
                      text: 'Spend Less.. Save More',
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 60.h),
                    gradientButton(text: 'Get started', onPressed: () {}),
                    customButton(text: 'I have an account', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
