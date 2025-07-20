import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer_ui/features/screens/auth/login/login_screen.dart';
import 'package:trackizer_ui/features/screens/auth/register/register1_screen.dart';
import 'package:trackizer_ui/features/screens/auth/register/register2_screen.dart';
import 'package:trackizer_ui/features/screens/auth/welcome_screen.dart';
import 'package:trackizer_ui/features/screens/budget/spending_screen.dart';
// import 'package:trackizer/features/screens/auth/register/register1_screen.dart';
// import 'package:trackizer/features/screens/auth/register/register2_screen.dart';
// import 'package:trackizer/features/screens/auth/welcome_screen.dart';
// import 'package:trackizer/features/screens/auth/welcome_screen.dart';
// import 'package:trackizer/features/screens/cards/credit_cards_screen.dart';
// import 'package:trackizer/features/screens/subscriptions/subscription_info_screen.dart';
import 'package:trackizer_ui/features/screens/calendar/calendar_screen.dart';
import 'package:trackizer_ui/features/screens/cards/credit_cards_screen.dart';
import 'package:trackizer_ui/features/screens/subscriptions/add_subscription_screen.dart';
import 'package:trackizer_ui/features/screens/subscriptions/subscription_info_screen.dart';
// import 'package:trackizer/features/screens/subscriptions/add_subscription_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Trackizer',
        theme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
