import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/features/screens/auth/register/register1_screen.dart';
import 'package:trackizer/features/screens/auth/register/register2_screen.dart';
import 'package:trackizer/features/screens/auth/welcome_screen.dart';
import 'package:trackizer/features/screens/home/home_upcoming_screen.dart';

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
        home:  Home2(),
      ),
    );
  }
}
