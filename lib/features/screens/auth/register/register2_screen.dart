import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/labeled_text_field.dart';
import 'package:trackizer/core/widgets/main_logo.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          Form(
            child: Column(
              children: [
                SizedBox(height: 58),
                MainLogo(width: 146, height: 24),
                SizedBox(height: 165),

                LabeledTextField(label: "E-mail address"),
                SizedBox(height: 16),

                LabeledTextField(label: "Password"),
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(9),
                            bottomLeft: Radius.circular(9),
                          ),
                          color: AppColors.mybordercolor,
                        ),
                        height: 5,
                        width: 79,
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: 79,
                        color: AppColors.mybordercolor,
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Container(
                        height: 5,
                        width: 79,
                        color: AppColors.mybordercolor,
                      ),
                    ),
                    SizedBox(width: 3),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(9),
                            bottomRight: Radius.circular(9),
                          ),
                          color: AppColors.mybordercolor,
                        ),
                        height: 5,
                        width: 79,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  "Use 8 or more characters with a mix of letters, numbers & symbols.",
                  style: TextStyle(
                    color: AppColors.myText,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 40),

                GradientButton(
                  text: ' Get started, it’s free!',
                  onPressed: () {},
                ),
                SizedBox(height: 80),
                Text(
                  "Do you have already an account?",
                  style: TextStyle(
                    color: AppColors.myWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: 20),

                CustomButton(text: 'Sign Up', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
