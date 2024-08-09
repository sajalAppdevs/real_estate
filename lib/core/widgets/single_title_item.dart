import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SingleTitleItem extends StatelessWidget {
  const SingleTitleItem(
      {super.key, this.imageUrl, required this.title, required this.onTap});

  final String? imageUrl;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {HapticFeedback.lightImpact(), onTap()},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.only(right: 16),
              clipBehavior: Clip.hardEdge,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: kStepperColor),
              child: Center(
                child: AppText(
                  title[0].toUpperCase(),
                  color: kContrastColor,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
                child: AppText(title.toUpperCase(),
                    size: 14, weight: FontWeight.w500)),
            SizedBox(
              width: 20,
              child: IconButton(
                onPressed: onTap,
                icon: const Icon(
                  CupertinoIcons.chevron_forward,
                  size: 16,
                  color: kDarkGreyColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
