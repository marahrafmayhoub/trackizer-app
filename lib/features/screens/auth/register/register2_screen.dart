import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer_ui/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer_ui/core/widgets/app_text.dart';
import 'package:trackizer_ui/core/widgets/labeled_text_field.dart';
import 'package:trackizer_ui/core/widgets/main_logo.dart';
=======
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/labeled_text_field.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d

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
                SizedBox(height: 58.h),
                MainLogo(width: 146, height: 24),
<<<<<<< HEAD
                SizedBox(height: 165.h),
=======
                SizedBox(height: 165),
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d

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
                AppText(
                  text:
                      "Use 8 or more characters with a mix of letters, numbers & symbols.",
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.myText,
                ),

                SizedBox(height: 40),

                GradientButton(
                  text: ' Get started, it’s free!',
                  onPressed: () {},
                ),
                SizedBox(height: 80),

                AppText(
                  text: 'Do you have already an account?',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontstyle: FontStyle.normal,
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
