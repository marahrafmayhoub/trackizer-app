import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/bottomNavbar.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_1.dart';
import 'package:trackizer/core/widgets/home_widgets/home_card_2.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
import 'package:trackizer/core/widgets/home_widgets/statistics_home_card.dart';
import 'package:trackizer/features/screens/budget/spending_screen.dart';
import 'package:trackizer/features/screens/calendar/calendar_screen.dart';
import 'package:trackizer/features/screens/cards/credit_cards_screen.dart';
import 'package:trackizer/features/screens/home/home_subs_screen.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  int navIndex = 0;

  final List<Widget> screens = const [
    HomeContent(), 
    BudgetsPage(),
    CalendarScreen(),
    CreditCardsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: Stack(
          children: [
            IndexedStack(index: navIndex, children: screens),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: NavBar(
                  currentIndex: navIndex,
                  onTap: (index) {
                    setState(() {
                      navIndex = index;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
