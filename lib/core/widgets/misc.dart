import 'package:real_estate/core/utils/assets.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    Key? key,
    required this.bgColor,
    required this.icon,
    this.size = 18,
  }) : super(key: key);

  final Color bgColor;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
      child: Icon(icon, size: 10, color: kWhite),
    );
  }
}
