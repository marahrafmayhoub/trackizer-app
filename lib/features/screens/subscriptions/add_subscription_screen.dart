import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:trackizer_ui/core/constants/app_colors.dart';
import 'package:trackizer_ui/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer_ui/core/widgets/header.dart';
// import 'package:trackizer_ui/screens/login_screen.dart' hide AppColors;
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/subscription_widgets/price_section.dart';
import 'package:trackizer/core/widgets/subscription_widgets/subscription_selector.dart';
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  double monthlyPrice = 5.99;
  final TextEditingController descriptionController = TextEditingController();

  void increasePrice() => setState(() => monthlyPrice += 1.0);
  void decreasePrice() => setState(() {
    if (monthlyPrice > 0) monthlyPrice -= 1.0;
  });

  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.5,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 476.h,
                decoration: BoxDecoration(
                  color: AppColors.mybordercolor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: HeaderWithIcons(
                        text: 'New',
                        icons: [
                          HeaderIcon(
                            assetPath: 'assets/icons/header_icons/Back.svg',
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 24),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const AppText(
                      text: 'Add new\nsubscription',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 56),
                    SubscriptionSelector(controller: _pageController),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              AppText(
                text: "Description",
                color: AppColors.myText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 4),
              Container(
                height: 48.h,
                width: 327.w,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Color(0xff353542)),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),

              const SizedBox(height: 45),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildPriceButton(Icons.remove, decreasePrice),
                    Column(
                      children: [
                        const AppText(
                          text: "Monthly price",
                          color: Color(0xff83839C),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          text: '${monthlyPrice.toStringAsFixed(2)} SP',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: 162.w,
                          height: 1,
                          color: AppColors.mybordercolor,
                        ),
                      ],
                    ),
                    buildPriceButton(Icons.add, increasePrice),
                  ],
                ),
              ),

              const SizedBox(height: 32),

<<<<<<< HEAD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: GradientButton(
                    text: "Add this platform",
                    onPressed: () {
                      print(
                        'Added: ${descriptionController.text} | $monthlyPrice SP',
                      );
                    }, textColor: AppColors.myWhite,
                    
                  ),
                ),
              ),

              const SizedBox(height: 32),
=======
              GradientButton(text: "Add this platform", onPressed: () {}),
>>>>>>> a364b91a339b36b294d86f6474a0683aff63b10d
            ],
          ),
        ),
      ),
    );
  }

}
