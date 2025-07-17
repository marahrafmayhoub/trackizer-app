import 'package:dotted_border/dotted_border.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/constants/app_colors.dart';
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
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: appText(
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
                ],
              ),

              appText(text: 'Subscriptions', fontSize: 16),
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

              Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: DottedBorder(
                      child: Container(
                        height: 60.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Add new card',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
