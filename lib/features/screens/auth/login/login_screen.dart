import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/labeled_text_field.dart';
import 'package:trackizer/core/widgets/main_logo.dart';

///  شاشة تسجيل الدخول
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logging in...')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: MainLogo(width: 146.w, height: 24),
            ),
            SizedBox(height: 165.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    LabeledTextField(
                      label: 'Login',
                      controller: emailController,
                    ),
                    SizedBox(height: 16.h),
                    LabeledTextField(
                      label: 'Password',
                      controller: passwordController,
                      obscureText: true,
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) =>
                                  setState(() => rememberMe = value!),
                              activeColor: AppColors.myOrange,
                            ),
                            AppText(
                              text: 'Remember me',
                              color: AppColors.myText,
                              fontSize: 14,
                            ),
                          ],
                        ),
                        AppText(
                          text: 'Forget Password',
                          fontSize: 14,
                          color: AppColors.myText,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    GradientButton(
                      text: 'Sign In',
                      onPressed: handleLogin,
                    ),
                    SizedBox(height: 152.h),
                    AppText(text: "If you don't have an account yet?",fontSize: 14,),
                    SizedBox(height: 20.h),
                    CustomButton(text: 'Sign Up', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
