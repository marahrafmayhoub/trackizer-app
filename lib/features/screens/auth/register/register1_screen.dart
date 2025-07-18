import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/main_logo.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1ScreenState();
}

class _Register1ScreenState extends State<Register1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: ListView(
        padding: EdgeInsets.only(top: 58, right: 24, left: 24),
        children: [
          mainLogo(width: 146, height: 24),
          SizedBox(height: 312),
          gradientButton(
            text: 'Sign Up with Apple',
            onPressed: () {},
            gradientColors: [Color(0xff101010), Color(0xff000000)], textColor: AppColors.myWhite,
          ),
          gradientButton(
            text: "Sign Up with Google",
            onPressed: () {},
            gradientColors: [Color(0xffFEFEFE), Color(0xffFFFFFF)], textColor: AppColors.myBlack,
          ),
          gradientButton(
            text: 'Sign Up with Facebook',
            
            onPressed: () {},
            gradientColors: [Color(0xff3483E9), Color(0xff1771E6)], textColor: AppColors.myWhite,
          ),
          SizedBox(height: 40),
          Container(
            child: Center(
              child: Text('or', style: TextStyle(color: AppColors.myWhite)),
            ),
          ),
          SizedBox(height: 40),
          customButton(text: 'Sign Up with E-mail', onPressed: () {}),
          SizedBox(height: 24),
          Container(
            child: Text(
              "By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.",
              style: TextStyle(
                color: AppColors.mysecondrytext,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                
              ),textAlign:TextAlign.center ,
            ),
          ),
        ],
      ),
    );
  }
}
