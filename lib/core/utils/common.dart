import 'dart:io';

import 'package:real_estate/core/utils/assets.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_network_image.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.avatar,
    this.avatarColor,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? avatarColor;
  final EdgeInsets? margin;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: avatar != null
          ? Center(child: SvgPicture.asset(avatar!, width: 20, height: 20))
          : Center(
              child:
                  Icon(Icons.person, size: 20, color: avatarColor ?? kWhite)),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.asset,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final String asset;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: Center(
        child: SvgPicture.asset(
          asset,
          width: assetSize ?? 20,
          height: assetSize ?? 20,
        ),
      ),
    );
  }
}

class CircularImageContainer extends StatelessWidget {
  const CircularImageContainer({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.asset,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final String asset;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: Center(
        child: Image.asset(
          asset,
          color: assetColor,
          width: assetSize ?? 20,
          height: assetSize ?? 20,
        ),
      ),
    );
  }
}

class CircularContainerIcon extends StatelessWidget {
  const CircularContainerIcon({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.icon,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final IconData icon;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 24,
      height: size ?? 24,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: Center(
        child: Icon(icon,
            size: assetSize ?? 12, color: assetColor ?? kContrastColor),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.titleSize,
    this.subSize,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final double? titleSize;
  final double? subSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(title, weight: FontWeight.w600, color: kDarkGreyColor),
              const SizedBox(height: 8),
              AppText(subTitle, weight: FontWeight.w600, color: kLightGreyColor)
            ],
          ),
        ),
        Container(
          width: 65,
          height: 29,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Center(
              child: AppText("Copy", size: 13, weight: FontWeight.w500)),
        )
      ],
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 54,
        height: 30,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppText(
            title,
            color: kPrimaryColor,
            size: 13,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class DigitButton extends StatelessWidget {
  const DigitButton({Key? key, required this.digit, required this.onTap})
      : super(key: key);
  final String digit;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double size = Platform.isIOS ? 80 : 72;
    return InkWell(
      onTap: () => {HapticFeedback.heavyImpact(), onTap()},
      splashColor: kSecondaryColorVariant,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: AppText(digit,
              size: 24, weight: FontWeight.w600, color: kContrastColor),
        ),
      ),
    );
  }
}

class PinCodeItem extends StatelessWidget {
  const PinCodeItem({Key? key, required this.hasValue}) : super(key: key);

  final bool hasValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kStrokeColor, width: 2),
      ),
      child: hasValue
          ? Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: kContrastColor),
            )
          : null,
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.svg,
    required this.header,
    required this.description,
  });

  final String svg;
  final String header;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 52),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularContainer(
            size: 64,
            asset: svg,
            color: kSecondaryColor,
            assetColor: kPrimaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 8),
            child: HeadingText(header),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Tap on the",
              style: const TextStyle(
                  color: kDarkGreyColor,
                  height: 1.5,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              children: [
                const TextSpan(
                  text: " + ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kContrastColor),
                ),
                const TextSpan(text: "button below to "),
                TextSpan(text: description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
