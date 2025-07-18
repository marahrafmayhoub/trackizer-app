import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
// import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AppText(
                      text: 'Credit Cards',
                      fontSize: 16,
                      color: Color(0xffA2A2B5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 23),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset('assets/icons/Settings.svg'),
                    ),
                  ),

                   Align(alignment: Alignment.bottomCenter,
                     child: Container(
                                     height: 185,
                                     padding: const EdgeInsets.all(20),
                                     decoration: BoxDecoration(
                                       color: const Color(0xff353542),
                                       borderRadius: BorderRadius.circular(20),
                                     ),
                                     child: Column(
                                       children: [
                      Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(12),
                        ),
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

              SizedBox(height: 43),

              Stack(
                children: [
                  Transform.rotate(
                    angle: 8 * (pi / 180),
                    child: Container(
                      width: 232.w,
                      height: 349.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff252530),
                        // border:Border.all(width: 1,color: Color(0xffCFCFFC))
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: 4 * (pi / 180),
                    child: Container(
                      width: 232.w,
                      height: 349.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff4E4E61).withOpacity(0.75),
                        // border:Border.all(width: 1,color: Color(0xffCFCFFC))
                      ),
                    ),
                  ),

                  Container(
                    width: 232.w,
                    height: 349.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff252530),
                      // border:Border.all(width: 1,color: Color(0xffCFCFFC))
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -72.h,
                          left: 96.w,
                          child: Container(
                            width: 260,
                            height: 260,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.05),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 125.h,
                          left: -55.w,
                          child: Container(
                            width: 379,
                            height: 379,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.03),
                            ),
                          ),
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
                                // SizedBox(height: 90.h,),
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
                    SvgPicture.asset(
                      'assets/icons/spotify.svg',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 8),
                    SvgPicture.asset(
                      'assets/icons/youtube.svg',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 8),

                    SvgPicture.asset(
                      'assets/icons/cloud.svg',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 8),

                    SvgPicture.asset(
                      'assets/icons/netflix.svg',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 48),
              // Container(
              //   height: 185,
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: const Color(0xff353542),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Column(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(14),
              //         decoration: BoxDecoration(
              //           border: Border.all(color: Colors.white24),
              //           borderRadius: BorderRadius.circular(12),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             AppText(text: 'Add new card'),
              //             SizedBox(width: 10.w),
              //             SvgPicture.asset(
              //               'assets/images/credit_card_screen_images/add.svg',
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Column(
              //   children: [
              //     GestureDetector(
              //       onTap: () {},
              //       child: DottedBorder(
              //         child: Container(
              //           height: 60.h,
              //           width: double.infinity,
              //           alignment: Alignment.center,
              //           child: Text(
              //             'Add new card',
              //             style: TextStyle(
              //               color: Colors.white70,
              //               fontSize: 14.sp,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
