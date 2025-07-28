import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/features/screens/auth/login/login_screen.dart';
import 'package:trackizer/features/screens/auth/welcome_screen.dart';
import 'package:trackizer/features/screens/calendar/calendar_screen.dart';
import 'package:trackizer/features/screens/cards/credit_cards_screen.dart';
import 'package:trackizer/features/screens/home/home_upcoming_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844), 
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Trackizer',
          theme: ThemeData(
            fontFamily: 'Inter',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          debugShowCheckedModeBanner: false,
          home: WelcomeScreen(),
        );
      },
    );
  }
}
