import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/circle_card.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/custom_card.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/custom_icons.dart';
import 'package:trackizer/core/widgets/header.dart';

class CreditCardsScreen extends StatefulWidget {
  const CreditCardsScreen({super.key});

  @override
  State<CreditCardsScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreditCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                HeaderWithIcons(
                  text: 'text',
                  icons: [
                    HeaderIcon(
                      assetPath: 'assets/icons/Settings.svg',
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 23),
                    ),
                  ],
                ),

                SizedBox(height: 43),

                Stack(
                  children: [
                    CustomCard(
                      rotationDegree: 8,
                      offset: Offset(30, 0),
                      color: Color(0xff4E4E61).withOpacity(0.35),
                    ),
                    CustomCard(
                      rotationDegree: 4,
                      offset: Offset(15, 0),
                      color: Color(0xff4E4E61).withOpacity(0.75),
                    ),

                    Container(
                      width: 232.w,
                      height: 349.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff252530),
                      ),
                      child: Stack(
                        children: [
                          CircleCard(
                            width: 260,
                            height: 260,
                            opacity: 0.05,
                            top: -72,
                            left: 96,
                          ),
                          CircleCard(
                            width: 379,
                            height: 379,
                            opacity: 0.03,
                            top: 125,
                            left: -55,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/credit_card_screen_images/MasterCardLogo.svg',
                                    width: 56.w,
                                  ),
                                  SizedBox(height: 16.h),
                                  AppText(text: 'Virtual Card'),
                                  Spacer(),
                                  AppText(text: 'John doe', fontSize: 12),
                                  SizedBox(height: 8.h),
                                  AppText(text: '**** **** **** 2197'),
                                  SizedBox(height: 8.h),

                                  AppText(text: '08/28', fontSize: 14),
                                  SizedBox(height: 16.h),

                                  SvgPicture.asset(
                                    'assets/images/credit_card_screen_images/Vector.svg',
                                    width: 38.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 23),
                AppText(text: 'Subscriptions', fontSize: 16),
                SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomIcon(assetPath: 'assets/icons/spotify.svg'),
                      SizedBox(width: 8),
                      CustomIcon(assetPath: 'assets/icons/youtube.svg'),
                      SizedBox(width: 8),
                      CustomIcon(assetPath: 'assets/icons/cloud.svg'),
                      SizedBox(width: 8),
                      CustomIcon(assetPath: 'assets/icons/netflix.svg'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      color: Color(0xff4E4E61),
                      radius: Radius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 328, // 👈 هنا نحدد العرض المطلوب
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(text: 'Add new card'),
                              SizedBox(width: 10.w),

                              SvgPicture.asset(
                                'assets/images/credit_card_screen_images/add.svg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
