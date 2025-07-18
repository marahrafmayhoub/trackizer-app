import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

/////ألواننا
class AppColors {
  static const Color myOrange = Color(0xffFF8500);
  static const Color myBlack = Color(0xff1C1C23);
  static const Color myGrey = Color(0xff938C8C);
  static const Color myWhite = Color(0xffFFFFFF);
  static const Color myBackground = Color(0xff1C1C23);
  static const Color mysecondrytext = Color(0xffBDBDBD);
  static const Color mybordercolor = Color(0xff444444);
}

///   ليبل تيكست
class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  const LabeledTextField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.mysecondrytext,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: GoogleFonts.inter(color: AppColors.myWhite),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: AppColors.myGrey, fontSize: 14.sp),
            filled: true,
            fillColor: Colors.black.withOpacity(0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mybordercolor),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.mybordercolor),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.myGrey),
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
            ),
          ),
        ),
      ],
    );
  }
}

///  اللوغو
class MainLogo extends StatelessWidget {
  final double width;
  final double height;

  const MainLogo({
    Key? key,
    this.width = 24,
    this.height = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      width: width.w,
      height: height.h,
      fit: BoxFit.contain,
    );
  }
}

///  زر signin
class GradientButton extends StatelessWidget {
  final String text;
  final List<Color> gradientColors;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const GradientButton({
    Key? key,
    required this.text,
    this.gradientColors = const [Color(0xffffA726), Color(0xffFF7F37)],
    this.width = 324,
    this.height = 48,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(999.r),
        boxShadow: [
          BoxShadow(
            color: gradientColors.first.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999.r),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

///  زر Sign Up
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 324,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(
          width: 1,
          color: AppColors.myWhite.withOpacity(0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(999.r),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: AppColors.myWhite,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          MainLogo(width: 24, height: 24),
                        ],
                      ),
                      SizedBox(height: 160.h),

                      LabeledTextField(
                        label: 'Username',
                        hintText: 'Enter your username',
                        controller: emailController,
                      ),
                      SizedBox(height: 20.h),

                      LabeledTextField(
                        label: 'Password',
                        hintText: 'Enter your password',
                        controller: passwordController,
                        obscureText: true,
                      ),
                      SizedBox(height: 16.h),

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
                              Text(
                                'Remember me',
                                style: GoogleFonts.inter(
                                  color: AppColors.myGrey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Forgot password',
                            style: GoogleFonts.inter(
                              color: AppColors.myGrey,
                              fontSize: 14.sp,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      GradientButton(
                        text: 'Sign In',
                        onPressed: handleLogin,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 24.h),
                  Text(
                    "If you don't have an account yet?",
                    style: GoogleFonts.inter(color: AppColors.myGrey),
                  ),
                  SizedBox(height: 8.h),
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {},
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
