import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/app_text.dart';
import 'package:trackizer_ui/core/widgets/custom_column.dart';
import 'package:trackizer_ui/core/widgets/header.dart';
import 'package:trackizer_ui/core/widgets/sbscriprionModel.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final days = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
  final dates = ['08', '09', '10', '11', '12', '13', '14'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 386.h,
              decoration: BoxDecoration(
                color: Color(0xff353542),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWithIcons(
                      text: 'Calendar',
                      icons: [
                        HeaderIcon(
                          assetPath: 'assets/icons/Settings.svg',
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 32),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        top: 43,
                        // right: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(text: 'subs', fontSize: 40),
                              AppText(text: 'Schedule', fontSize: 40),
                            ],
                          ),
                          SizedBox(height: 22.h),
                          Row(
                            children: [
                              AppText(
                                text: '3 subscriptions for today',
                                fontSize: 14,
                                color: AppColors.myText,
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 24),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.myWhite.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    child: Row(
                                      children: [
                                        AppText(text: 'January', fontSize: 12),
                                        SizedBox(width: 2),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 14,
                                          color: AppColors.myWhite,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Container(
                            height: 103,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    width: 48.w,
                                    height: 103.h,
                                    decoration: BoxDecoration(
                                      color:
                                          index == 0
                                              ? Color(0xff4E4E61)
                                              : Color(
                                                0xff4E4E61,
                                              ).withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: InfoColumn(
                                        title: dates[index],
                                        subtitle: days[index],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  InfoColumn(title: 'January', subtitle: '01.08.2022'),
                  Spacer(),
                  InfoColumn(title: '24.98 SP', subtitle: 'in upcoming bills'),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shrinkWrap: true,
                itemCount: subscriptions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) {
                  final item = subscriptions[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff353542),
                    ),
                    width: 160,
                    height: 168,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(item.iconPath),
                          Spacer(),
                          AppText(text: item.name, fontSize: 14),
                          AppText(text: item.price, fontSize: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
