import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class HomeCard1 extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  const HomeCard1({
    super.key,
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 24),
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
          clipBehavior: Clip.hardEdge,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
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
