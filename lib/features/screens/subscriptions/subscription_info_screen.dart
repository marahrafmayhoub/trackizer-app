import 'dart:convert';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_buttons/custom_button.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/custom_row.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/subscription_widgets/ellipse.dart';
import 'package:trackizer/features/screens/home/home_upcoming_screen.dart';
import 'package:trackizer/features/screens/settings/settings_screen.dart';

class SubscriptionInfoScreen extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String description;

  const SubscriptionInfoScreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.description,
  });

  Future<void> submitSubscription(BuildContext context) async {
  final url = Uri.parse(
    'https://ftcbwmmsnykncncsyrfs.supabase.co/rest/v1/user_subscriptions',
  );

  final Map<String, dynamic> data = {
    "name": name,
    "price": double.tryParse(price.replaceAll(" SP", "")) ?? 0.0,
    "description": description,
    "image": imagePath,
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Subscription saved successfully")),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home2()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save subscription")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("An error occurred")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E0E12),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Container(
            height: 766.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 334.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: Color(0xff353542),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          SizedBox(height: 32.h),
                          HeaderWithIcons(
                            text: 'Subscription info',
                            textColor: Color(0xffA2A2B5),
                            icons: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset(
                                  'assets/icons/header_icons/Trash.svg',
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SvgPicture.asset(
                                  'assets/icons/header_icons/ArrowDown.svg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 34.h),

                          SvgPicture.asset(
                            imagePath,
                            width: 106.w,
                            height: 106.h,
                          ),
                          SizedBox(height: 16),
                          AppText(text: name, fontSize: 32),
                          AppText(
                            text: price,
                            fontSize: 20,
                            color: Color(0xffA2A2B5),
                          ),
                          SizedBox(height: 42),
                        ],
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 420.h,
                    decoration: BoxDecoration(
                      color: AppColors.myBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 32,
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 300.h,
                            decoration: BoxDecoration(
                              color: Color(0xff4E4E61).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 16,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRow(label: 'Name', value: name),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Description',
                                    value: description,
                                    highlightValue: true, // ✅ هذا هو المطلوب
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Category',
                                    value: 'Enterteinment',
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'First Payment',
                                    value: '08.01.2022',
                                  ),
                                  SizedBox(height: 16),
                                  CustomRow(label: 'Reminder', value: 'Never'),
                                  SizedBox(height: 16),
                                  CustomRow(
                                    label: 'Currency',
                                    value: 'Syrian Pound (SP)',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 8,),
                          Spacer(),
                          CustomButton(
                            text: 'save',
                            onPressed: () {
                              submitSubscription(context);

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Transform.translate(
                    offset: Offset(0.w, -62.h),
                    child: DottedLine(
                      dashColor: Color(0xff131318),
                      lineThickness: 2,
                      dashLength: 7,
                      dashGapLength: 10,
                    ),
                  ),
                ),

                Ellipse(
                  assetPath:
                      'assets/images/subscription_info_images/Ellipse.svg',
                  alignment: Alignment.topLeft,
                  offset: Offset(-10.w, 285.h),
                ),
                Ellipse(
                  assetPath:
                      'assets/images/subscription_info_images/Ellipse.svg',
                  alignment: Alignment.topRight,
                  offset: Offset(10.w, 285.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
