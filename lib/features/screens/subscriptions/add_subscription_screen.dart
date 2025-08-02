import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trackizer/core/widgets/subscription_widgets/subs_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/subscription_widgets/price_section.dart';
import 'package:trackizer/core/widgets/subscription_widgets/subscription_selector.dart';
import 'package:trackizer/features/screens/subscriptions/subscription_info_screen.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  double monthlyPrice = 5.99;
  int selectedIndex = 1;

   void navy(){
    Navigator.pop(context);
  }

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
                            onTap: navy,
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
                      fontstyle: FontStyle.normal,
                    ),

                    const SizedBox(height: 56),
                    Expanded(
                      child: SubscriptionSelector(
                        controller: _pageController,
                        onItemChanged: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              AppText(
                text: "Description",
                color: AppColors.myText,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontstyle: FontStyle.normal,
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
                  controller: descriptionController,
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
                          fontstyle: FontStyle.normal,
                        ),
                        const SizedBox(height: 8),
                        AppText(
                          text: '${monthlyPrice.toStringAsFixed(2)} SP',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontstyle: FontStyle.normal,
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

              GradientButton(
                text: "Add this platform",
                onPressed: () {
                  final selectedItem = subscriptions[selectedIndex];

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SubscriptionInfoScreen(
                        imagePath: selectedItem.imagePath,
                        name: selectedItem.name,
                        price: '${monthlyPrice.toStringAsFixed(2)} SP',
                        description: descriptionController.text,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
