import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BudgetCategoryCard extends StatelessWidget {
  final String title;
  final double spent;
  final double total;
  final String subtitle;
  final IconData icon;
  final Color progressColor;

  const BudgetCategoryCard({
    super.key,
    required this.title,
    required this.spent,
    required this.total,
    required this.subtitle,
    required this.icon,
    this.progressColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    double remaining = total - spent;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xff4E4E61).withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: Color(0xffCFCFFC).withOpacity(0) )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 24.sp),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '$remaining SP left to spend',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${spent.toStringAsFixed(2)} SP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'of ${total.toStringAsFixed(0)} SP',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: spent / total,
              backgroundColor: Colors.white.withOpacity(0.1),
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              minHeight: 4.h,
            ),
          ),
        ],
      ),
    );
  }
}
