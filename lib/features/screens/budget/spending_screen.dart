import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/app_text.dart';
import 'package:trackizer_ui/core/widgets/header.dart';
import 'package:trackizer_ui/core/widgets/spendings_widgets/budget_Item.dart';
import 'package:trackizer_ui/core/widgets/spendings_widgets/indecator.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          children: [
            HeaderWithIcons(
              text: 'Spending & Budgets',
              icons: [
                HeaderIcon(
                  assetPath: 'assets/icons/Settings.svg',
                  alignment: Alignment.topRight,
                ),
              ],
            ),

            SizedBox(height: 43.h),

            HalfCircleBudgetGauge(value: 82.97, max: 200),

            // SizedBox(height: 40.h,),
            Container(
              width: 328.w,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: Color(0xff4E4E61)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(text: 'Your budgets are on track', fontSize: 14),
                  SizedBox(width: 8),
                  AppText(text: '👍', fontSize: 14),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            BudgetCategoryCard(
              title: 'Auto & Transport',
              spent: 25.99,
              total: 400,
              subtitle: 'subtinb mn mntle',
              icon: Icons.directions_car,
              progressColor: AppColors.myGreen,
            ),
            SizedBox(height: 8),

            BudgetCategoryCard(
              title: 'Entertainment',
              spent: 50.99,
              total: 600,
              subtitle: 'scccccccccccccubtinb mn mntle',
              icon: Icons.movie_filter,
              progressColor: AppColors.myOrange,
            ),
            SizedBox(height: 8),

            BudgetCategoryCard(
              title: 'Security',
              spent: 5.99,
              total: 600,
              subtitle: 'subtinb mn mntle',
              icon: Icons.fingerprint,
              progressColor: AppColors.myPurple,
            ),

            SizedBox(height: 8),

            // ======= Add New Category =======
            Container(
              width: 328.w,

              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(16),
                  color: Color(0xff4E4E61),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 89,
                    vertical: 32,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppText(
                        text: 'Add new category',
                        color: Color(0xffA2A2B5),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        'assets/images/credit_card_screen_images/add.svg',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
