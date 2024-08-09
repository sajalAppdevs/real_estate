import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class NameInitial extends StatelessWidget {
  const NameInitial({super.key, required this.initials, this.size = 40});

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 16),
      decoration: const BoxDecoration(color: kSecondaryColor, shape: BoxShape.circle),
      child:
          Center(child: AppText(initials, size: 13, weight: FontWeight.w600)),
    );
  }
}
