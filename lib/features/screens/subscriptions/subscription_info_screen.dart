import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/custom_row.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/subscription_widgets/ellipse.dart';

// import 'package:trackizer/core/constants/app_colors.dart';
// import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
// import 'package:trackizer/core/widgets/app_text.dart';
// import 'package:trackizer/core/widgets/custom_row.dart';
// import 'package:trackizer/core/widgets/header.dart';
// import 'package:trackizer/core/widgets/subscription_widgets/ellipse.dart';

class SubscriptionInfoScreen extends StatelessWidget {
  const SubscriptionInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E0E12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: 766.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 334.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Color(0xff353542),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          SizedBox(height: 32.h),
                          HeaderWithIcons(
                            text: 'Subscription info',
                            textColor: Color(0xffA2A2B5),
                            icons: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  'assets/icons/header_icons/Trash.svg',
                                ),
                              ), Align(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(
                                  'assets/icons/header_icons/ArrowDown.svg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 34.h),

                          SvgPicture.asset(
                            'assets/icons/spotify.svg',
                            width: 106.w,
                            height: 106.h,
                          ),
                          SizedBox(height: 16),
                          AppText(text: 'Spotify', fontSize: 32),
                          AppText(
                            text: '5.99 SP',
                            fontSize: 20,
                            color: Color(0xffA2A2B5),
                          ),
                          SizedBox(height: 42),
                        ],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 432.h,
                    decoration: BoxDecoration(
                      color: AppColors.myBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 32,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 300.h,
                            decoration: BoxDecoration(
                              color: Color(0xff4E4E61).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRow(label: 'Name', value: 'Spotify'),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Description',
                                    value: 'Music app',
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Category',
                                    value: 'Enterteinment',
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'First Payment',
                                    value: '08.01.2022',
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(label: 'Reminder', value: 'Never'),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Currency',
                                    value: 'Syrian Pound (SP)',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 32,),
                          Spacer(),
                          CustomButton(text: 'save', onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Transform.translate(
                    offset: Offset(0.w, -50.h),
                    child: DottedLine(
                      dashColor: Color(0xff131318),
                      lineThickness: 2,
                      dashLength: 7,
                      dashGapLength: 10,
                    ),
                  ),
                ),

                Ellipse(
                  assetPath:
                      'assets/images/subscription_info_images/Ellipse.svg',
                  alignment: Alignment.topLeft,
                  offset: Offset(-10.w, 320.h),
                ),
                Ellipse(
                  assetPath:
                      'assets/images/subscription_info_images/Ellipse.svg',
                  alignment: Alignment.topRight,
                  offset: Offset(10.w, 320.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
