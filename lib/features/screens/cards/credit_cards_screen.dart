import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/bottomNavbar.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/circle_card.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/custom_card.dart';
import 'package:trackizer/core/widgets/credit_cards_widgets/custom_icons.dart';
import 'package:trackizer/core/widgets/dottedBorder.dart';
import 'package:trackizer/core/widgets/header.dart';

import 'package:trackizer/core/widgets/credit_cards_widgets/custom_icons.dart'
    show CustomIcon;

class CreditCardsScreen extends StatefulWidget {
  const CreditCardsScreen({super.key});

  @override
  State<CreditCardsScreen> createState() => _CreditCardsScreenState();
}

class _CreditCardsScreenState extends State<CreditCardsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: HeaderWithIcons(
                    text: 'text',
                    icons: [
                      HeaderIcon(
                        assetPath: 'assets/icons/Settings.svg',
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(right: 23),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 43),
                Stack(
                  children: [
                    CustomCard(
                      rotationDegree: 8,
                      offset: Offset(30, 8),
                      color: Color(0xff4E4E61).withOpacity(0.35),
                    ),
                    CustomCard(
                      rotationDegree: 4,
                      offset: Offset(15, 6),
                      color: Color(0xff4E4E61).withOpacity(0.75),
                    ),
                    Container(
                      width: 232.w,
                      height: 349.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color.fromRGBO(207, 207, 252, 0.15),
                            const Color.fromRGBO(207, 207, 252, 0.0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.all(1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff252530),
                          borderRadius: BorderRadius.circular(16),
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
                    ),
                  ],
                ),

                SizedBox(height: 51),
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
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 185.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.mybordercolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Center(
                  child: AddCardButton(
                    text: 'Add new card',
                    onTap: () {},
                    width: 328.w,
                    height: 52.h,
                  ),
                ),
              ),
            ),

            // Align(alignment: Alignment.bottomCenter,
            //   child: NavBar(
            //     currentIndex: currentIndex,
            //     onTap: (index) {
            //       setState(() {
            //         currentIndex = index;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
