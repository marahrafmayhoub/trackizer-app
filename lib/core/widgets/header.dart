import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackizer_ui/core/widgets/app_text.dart';

class HeaderWithIcons extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;

  final List<HeaderIcon> icons;

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
        ...icons.map((icon) => Align(
              alignment: icon.alignment,
              child: Padding(
                padding: icon.padding,
                child: SvgPicture.asset(icon.assetPath),
              ),
            )),
      ],
    );
  }
}

class HeaderIcon {
  final String assetPath;
  final Alignment alignment;
  final EdgeInsets padding;

  HeaderIcon({
    required this.assetPath,
    required this.alignment,
    this.padding = EdgeInsets.zero,
  });
}
