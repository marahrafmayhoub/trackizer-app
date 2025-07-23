import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer_ui/features/screens/auth/login/login_screen.dart';
import 'package:trackizer_ui/features/screens/auth/register/register1_screen.dart';
import 'package:trackizer_ui/features/screens/auth/register/register2_screen.dart';
import 'package:trackizer_ui/features/screens/auth/welcome_screen.dart';
import 'package:trackizer_ui/features/screens/cards/credit_cards_screen.dart';
import 'package:trackizer_ui/features/screens/home/home_upcoming_screen.dart';
import 'package:trackizer_ui/features/screens/subscriptions/add_subscription_screen.dart';
import 'package:trackizer_ui/features/screens/subscriptions/subscription_info_screen.dart';
import 'package:trackizer_ui/my_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home2(),
      ),
    );
  }
}
