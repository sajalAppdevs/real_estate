import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem(
      {super.key, required this.title, required this.active, this.onTap});

  final String title;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 118,
        height: 34,
        decoration: BoxDecoration(
          color: active ? kContrastColor : kWhite,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: AppText(
            title,
            color: active ? kWhite : kContrastColor,
            size: 13,
            weight: active ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
