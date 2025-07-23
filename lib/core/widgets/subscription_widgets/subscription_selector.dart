import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/widgets/subscription_widgets/subs_data.dart';
import 'package:trackizer/core/widgets/app_text.dart';

class SubscriptionSelector extends StatefulWidget {
  final PageController controller;

  const SubscriptionSelector({super.key, required this.controller});

  @override
  State<SubscriptionSelector> createState() => _SubscriptionSelectorState();
}

class _SubscriptionSelectorState extends State<SubscriptionSelector> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: widget.controller,
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: widget.controller,
            builder: (context, child) {
              double value = 1.0;
              if (widget.controller.hasClients &&
                  widget.controller.page != null) {
                value = widget.controller.page! - index;
                value = (1 - (value.abs() * 0.5)).clamp(0.5, 1.0);
              }

              final item = subscriptions[index];

              return Transform.scale(
                scale: value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      item.imagePath,
                      width: 161.w,
                      height: 161.w,
                    ),
                    SizedBox(height: 23.h),
                    AppText(text: item.name),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
