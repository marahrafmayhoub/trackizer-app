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
                              AppText(
                                text: 'subs',
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                              AppText(
                                text: 'Schedule',
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          SizedBox(height: 22.h),
                          Row(
                            children: [
                              AppText(
                                text: '3 subscriptions for today',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
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
                                        AppText(
                                          text: 'January',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
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
                                      color: index == 0
                                          ? Color(0xff4E4E61)
                                          : Color(0xff4E4E61).withOpacity(0.2),
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
                          AppText(
                            text: item.name,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          AppText(
                            text: item.price,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
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

      floatingActionButton: Transform.translate(
        offset: const Offset(12, 5),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xffFF8500), Color(0xffFF8500)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xffffA726).withOpacity(0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // الشريط السفلي
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
        child: PhysicalModel(clipBehavior: Clip.hardEdge,

          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          elevation: 8,
          shadowColor: Colors.black.withOpacity(0.6),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 16,
              color: const Color(0xFF353542),
              child: SizedBox(
                width: 328, //
                height: 64, //
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  (Home + Budgets)
                    Row(
                      children: [
                        const SizedBox(width: 16), // مسافة من اليسار
                        // SvgPicture.asset(
                        //   'assets/home.svg',
                        //   width: 24,
                        //   height: 24,
                        //   colorFilter: const ColorFilter.mode(
                        //     Colors.white,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                        Icon(Icons.home),
                        const SizedBox(width: 24),

                        Icon(Icons.home),
                        // SvgPicture.asset(
                        //   'assets/Budgets.svg',
                        //   width: 24,
                        //   height: 24,
                        //   colorFilter: const ColorFilter.mode(
                        //     Colors.grey,
                        //     BlendMode.srcIn,
                        //   ),
                        // ),
                      ],
                    ),

                    // (Calendar + Credit Cards)
                    Row(
                      children: [
                        Icon(Icons.calendar_month),

                        const SizedBox(width: 24),

                        Icon(Icons.credit_card),
                        const SizedBox(width: 16), // مسافة من اليمين
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
