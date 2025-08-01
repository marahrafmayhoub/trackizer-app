import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/API/api_call.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/labeled_text_field.dart';
import 'package:trackizer/core/widgets/main_logo.dart';
import 'package:trackizer/features/screens/auth/login/login_screen.dart';

class Register2 extends StatefulWidget {
  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> signUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    if (email.isEmpty || password.length < 8 || !email.contains("@")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid email and a password with at least 8 characters.',
          ),
        ),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final data = await ApiService.registerUser(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('✅ Registered: ${data['email']}')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Form(
              child: Column(
                children: [
                  SizedBox(height: 58.h),
                  const MainLogo(width: 146, height: 24),
                  SizedBox(height: 165.h),
                  LabeledTextField(
                    label: "E-mail address",
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  LabeledTextField(
                    label: "Password",
                    controller: passwordController,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: index < 3 ? 3 : 0),
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppColors.mybordercolor,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(index == 0 ? 9 : 0),
                              right: Radius.circular(index == 3 ? 9 : 0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppText(
                    text:
                        "Use 8 or more characters with a mix of letters, numbers & symbols.",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.myText,
                  ),
                  const SizedBox(height: 40),

                  isLoading
                      ? const CircularProgressIndicator()
                      : GradientButton(
                          text: 'Get started, it’s free!',
                          onPressed: signUp,
                        ),

                  const SizedBox(height: 80),

                  AppText(
                    text: 'Already have an account?',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontstyle: FontStyle.normal,
                  ),
                  const SizedBox(height: 20),

                  CustomButton(
                    text: 'Log In',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
