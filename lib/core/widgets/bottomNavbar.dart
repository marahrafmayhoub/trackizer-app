import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/core/constants/app_colors.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  // خصائص قابلة للتعديل من الخارج:
  final List<IconData> iconList;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Widget? fabIcon;
  final VoidCallback? onFabPressed;
  final double fabSize;

  const NavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    this.iconList = const [
      Icons.home_outlined,
      Icons.grid_view_rounded,
      Icons.calendar_month_outlined,
      Icons.credit_card,
    ],
    this.backgroundColor = const Color(0xff4E4E61),
    this.activeIconColor = Colors.white,
    this.inactiveIconColor = Colors.grey,
    this.fabIcon,
    this.onFabPressed,
    this.fabSize = 48,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: widget.backgroundColor.withOpacity(0.75),
              borderRadius: BorderRadius.circular(24),
            ),
            clipBehavior: Clip.antiAlias,
            child: AnimatedBottomNavigationBar.builder(
              itemCount: widget.iconList.length,
              activeIndex: widget.currentIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              backgroundColor: widget.backgroundColor.withOpacity(0.75),
              tabBuilder: (index, isActive) {
                final color = isActive
                    ? widget.activeIconColor
                    : widget.inactiveIconColor;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Icon(widget.iconList[index], size: 25, color: color),
                );
              },
              onTap: widget.onTap,
            ),
          ),
        ),
        Positioned(
          bottom: 52,
          child: Container(
            width: widget.fabSize,
            height: widget.fabSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF9900), Color(0xFFFF6A00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.currentIndex == 3
                      ? AppColors.mybordercolor
                      : AppColors
                            .myBackground,
                  spreadRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: widget.onFabPressed ?? () {},
              backgroundColor: AppColors.myOrange,
              elevation: 8,
              shape: const CircleBorder(),
              child:
                  widget.fabIcon ??
                  const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
        ),
      ],
    );
  }
}
