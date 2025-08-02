import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class StatisticsHomeCard extends StatelessWidget {
  final String title;
  final String value;
  final Color topLineColor;

  const StatisticsHomeCard({
    Key? key,
    required this.title,
    required this.value,
    required this.topLineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromRGBO(207, 207, 252, 0.15),
                const Color.fromRGBO(207, 207, 252, 0.0),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.all(1),
          child: Container(
            width: 104,
            height: 68,
            decoration: BoxDecoration(
              color: AppColors.mybordercolor,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff83839C),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white, // يمكنك استبدالها بـ AppColors.myWhite
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            height: 2,
            width: 46,
            decoration: BoxDecoration(color: topLineColor),
          ),
        ),
      ],
    );
  }
}
