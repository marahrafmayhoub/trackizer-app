import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trackizer/core/API/api_call.dart';
import 'package:trackizer/core/constants/app_colors.dart';
import 'package:trackizer/core/widgets/app_text.dart';
import 'package:trackizer/core/widgets/dottedBorder.dart';
import 'package:trackizer/core/widgets/header.dart';
import 'package:trackizer/core/widgets/spendings_widgets/budget_Item.dart';
import 'package:trackizer/core/widgets/spendings_widgets/indecator.dart';
import 'package:trackizer/features/screens/settings/settings_screen.dart';

class BudgetsPage extends StatefulWidget {
  const BudgetsPage({super.key});
  @override
  State<BudgetsPage> createState() => _BudgetsPageState();
}

class _BudgetsPageState extends State<BudgetsPage> {
  List<Map<String, dynamic>> spendingCategories = [];
  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

    void navy(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
  }

  bool isLoaded = false;

  Future<void> fetchCategories() async {
    try {
      final categories = await ApiService.getSpendingCategories();
      setState(() {
        spendingCategories = categories;
        isLoaded = false;
      });
      
    } catch (e) {
      setState(() {
        isLoaded = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('حدث خطأ: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: HeaderWithIcons(
                  text: 'Spending & Budgets',
                  icons: [
                    HeaderIcon(
                      assetPath: 'assets/icons/Settings.svg',
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 24),
                      onTap: navy,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 63.h),
              HalfCircleBudgetGauge(value: 82.97, max: 200),
              Container(
                width: 328.w,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Color(0xff4E4E61)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(text: 'Your budgets are on track', fontSize: 14),
                    SizedBox(width: 8),
                    AppText(text: '👍', fontSize: 14),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              isLoaded
                  ? const CircularProgressIndicator()
                  : spendingCategories.isEmpty
                  ? const Text('لا توجد بيانات')
                  : ListView.builder(
                      itemCount: spendingCategories.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final category = spendingCategories[index];
                        final spent = category['spent']?.toDouble() ?? 0.0;
                        final total =
                            category['limit_amount']?.toDouble() ?? 1.0;

                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: BudgetCategoryCard(
                            title: category['name'] ?? 'Unnamed',
                            spent: spent,
                            total: total,
                            subtitle: 'Auto generated category',
                            icon: _getIconForCategory(category['name']),
                            progressColor: _getColorForIndex(index),
                          ),
                        );
                      },
                    ),

              SizedBox(height: 8.h),
              AddCardButton(
                text: 'Add new category',
                onTap: () {},
                textPadding: EdgeInsets.symmetric(vertical: 30),
                height: 84.h,
                width: 328.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

IconData _getIconForCategory(String? name) {
  switch (name?.toLowerCase()) {
    case 'auto & transport':
      return Icons.directions_car;
    case 'entertainment':
      return Icons.movie_filter;
    case 'security':
      return Icons.security;
    default:
      return Icons.category;
  }
}

Color _getColorForIndex(int index) {
  final colors = [
    AppColors.myGreen,
    AppColors.myOrange,
    AppColors.myPurple,
    Colors.blue,
  ];
  return colors[index % colors.length];
}
