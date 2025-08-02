import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer/core/widgets/app_text.dart';

class HeaderWithIcons extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final List<Widget> icons;

  const HeaderWithIcons({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.textColor = const Color(0xffA2A2B5),
    this.icons = const [],
  });   

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: AppText(
            text: text,
            fontSize: fontSize,
            color: textColor,
          ),
        ),
        ...icons,
      ],
    );
  }
}

class HeaderIcon extends StatelessWidget {
  final String assetPath;
  final Alignment alignment;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const HeaderIcon({
    super.key,
    required this.assetPath,
    required this.alignment,
    this.padding = EdgeInsets.zero,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(assetPath),
        ),
      ),
    );
  }
}
