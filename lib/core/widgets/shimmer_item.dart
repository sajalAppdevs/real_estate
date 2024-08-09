import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({
    Key? key,
    required this.height,
    required this.width,
    this.shape,
  }) : super(key: key);

  final double height;
  final double width;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kBubbleGrey.withOpacity(0.9),
      highlightColor: kBubbleGrey.withOpacity(0.9),
      child: Container(
        height: height,
        width: width,
        decoration: ShapeDecoration(
          color: kBubbleGrey,
          shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
