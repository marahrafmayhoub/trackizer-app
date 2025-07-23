import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/bottomNavbar.dart';
import 'package:trackizer/core/widgets/dottedBorder.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/spendings_widgets/budget_Item.dart';
import 'package:trackizer/core/widgets/spendings_widgets/indecator.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({super.key});

  @override
  State<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(

            children: [

              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: HeaderWithIcons(
                  text: 'Spending & Budgets',
                  icons: [
                    HeaderIcon(
                      assetPath: 'assets/icons/Settings.svg',
                      alignment: Alignment.topRight, padding: EdgeInsets.only(right: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 63.h),
              HalfCircleBudgetGauge(value: 82.97, max: 200),
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
              SizedBox(height: 8.h),
              BudgetCategoryCard(
                title: 'Entertainment',
                spent: 50.99,
                total: 600,
                subtitle: 'scccccccccccccubtinb mn mntle',
                icon: Icons.movie_filter,
                progressColor: AppColors.myOrange,
              ),
              SizedBox(height: 8.h),
              BudgetCategoryCard(
                title: 'Security',
                spent: 5.99,
                total: 600,
                subtitle: 'subtinb mn mntle',
                icon: Icons.fingerprint,
                progressColor: AppColors.myPurple,
              ),
              SizedBox(height: 8.h),
              AddCardButton(
                text: 'Add new category',
                onTap: () {},
                textPadding: EdgeInsets.symmetric(vertical: 30),
                height: 84.h,width: 328.w,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: NavBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
