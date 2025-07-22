import 'package:flutter/material.dart';
import 'package:trackizer_ui/core/constants/app_colors.dart';


class HomeCard2 extends StatelessWidget {
  final String title;
  final String price;
  final String month;
  final String day;

  const HomeCard2({
    super.key,
    required this.title,
    required this.price,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: 64,alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 24,),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mybordercolor),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: ListTile(
        
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.mybordercolor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                month,
                style: const TextStyle(
                  color: Color(0xffA3A2B5),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  color: Color(0xffA3A2B5),
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.myWhite,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        trailing: Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.myWhite,
          ),
        ),
      ),
    );
  }
}
