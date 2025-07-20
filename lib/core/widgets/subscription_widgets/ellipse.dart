import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ellipse extends StatelessWidget {
  final String assetPath;
  final Alignment alignment;
  final Offset offset;
  final double? width;
  final double? height;

  const Ellipse({
    super.key,
    required this.assetPath,
    required this.alignment,
    required this.offset,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: SvgPicture.asset(
          assetPath,
          width: width,
          height: height,
        ),
      ),
    );
  }
}
