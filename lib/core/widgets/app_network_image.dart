import 'package:cached_network_image/cached_network_image.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/extensions/extensions.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.imgUrl,
    this.size,
    this.title,
    this.borderRadius,
    this.placeholder,
    this.isCircular = true,
    this.isInitials = false,
  });

  final String imgUrl;
  final String? title;
  final double? size;
  final double? borderRadius;
  final bool isCircular;
  final Widget? placeholder;
  final bool isInitials;

  @override
  Widget build(BuildContext context) {
    final initial = title.value.isNotEmpty
        ? (isInitials ? title.value.initials : title.value.initial)
        : "";
    final radius = borderRadius ?? 0;
    Widget placeholderImg;
    if (placeholder != null) {
      placeholderImg = placeholder!;
    } else if (initial.isEmpty) {
      placeholderImg = const Center(
        child: Icon(CupertinoIcons.photo_on_rectangle, color: Colors.white),
      );
    } else {
      placeholderImg =
          Center(child: AppText(initial, size: 18, weight: FontWeight.w600, color: Colors.white));
    }
    return Container(
      width: size ?? 64,
      height: size ?? 64,
      decoration: BoxDecoration(
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
        color: kProfilePicColor,
        borderRadius: !isCircular ? BorderRadius.circular(radius) : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: imgUrl.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              errorWidget: (ctx, value, progress) => placeholderImg,
              progressIndicatorBuilder: (ctx, value, progress) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: kContrastColor, strokeWidth: 2));
              },
            )
          : placeholderImg,
    );
  }
}
