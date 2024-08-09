import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  const SectionDivider({Key? key, this.title, this.margin}) : super(key: key);

  final String? title;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 24),
      margin: margin ?? const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(color: kSecondaryColor),
      child: Row(
        children: [
          AppText(
            title ?? "",
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
