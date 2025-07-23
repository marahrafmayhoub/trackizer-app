import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavBar({Key? key, required this.currentIndex, required this.onTap})
    : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.home_outlined,
      Icons.grid_view_rounded,
      Icons.calendar_month_outlined,
      Icons.credit_card,
    ];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.mybordercolor,
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: AnimatedBottomNavigationBar.builder(
              itemCount: iconList.length,
              activeIndex: widget.currentIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              backgroundColor: Color(0xff4E4E61).withOpacity(0.75),
              tabBuilder: (index, isActive) {
                final color = isActive ? AppColors.myWhite : AppColors.myIcon;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Icon(iconList[index], size: 25, color: color),
                );
              },
              onTap: widget.onTap,
            ),
          ),
        ),
        Positioned(
          bottom: 52,
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9900), Color(0xFFFF6A00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.myBackground,
                  blurRadius: 0,
                  spreadRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.myOrange,
              elevation: 8,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
        ),
      ],
    );
  }
}
