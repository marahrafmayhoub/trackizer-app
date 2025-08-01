import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trackizer/core/widgets/subscription_widgets/subs_data.dart';

// import 'package:trackizer_ui/screens/login_screen.dart' hide AppColors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/gradient_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/subscription_widgets/price_section.dart';
import 'package:trackizer/core/widgets/subscription_widgets/subscription_selector.dart';

class AddSubscriptionScreen extends StatefulWidget {
  const AddSubscriptionScreen({super.key});

  @override
  State<AddSubscriptionScreen> createState() => _AddSubscriptionScreenState();
}

class _AddSubscriptionScreenState extends State<AddSubscriptionScreen> {
  double monthlyPrice = 5.99;
  int selectedIndex = 1;

  Future<void> submitSubscription() async {
    final url = Uri.parse(
      'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions',
    );

    final selectedItem = subscriptions[selectedIndex]; 

    final Map<String, dynamic> data = {
      "name": selectedItem.name,
      "price": monthlyPrice,
      "description": descriptionController.text,
      "image": selectedItem.imagePath,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ0Y2J3bW1zbnlrbmNuY3N5cmZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTMzNjYzMjMsImV4cCI6MjA2ODk0MjMyM30.6p3lvgHZNRpgKTroIxA5TH_CPe3QsnihRqpqV_f__kw',
          'Content-Type': 'application/json',
          'Prefer': 'return=representation',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Subscription added successfully");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Subscription added successfully")),
        );
        Navigator.pop(context); 
      } else {
        print("Failed to add subscription: ${response.body}");
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed to add subscription")));
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("An error occurred")));
    }
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
                onPressed: submitSubscription,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
