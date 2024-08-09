// ignore_for_file: prefer_const_constructors

import 'package:real_estate/core/widgets/shimmer_item.dart';
import 'package:flutter/material.dart';

class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerItem(height: 45, width: 45, shape: CircleBorder()),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerItem(height: 24, width: 144),
                  SizedBox(height: 4),
                  ShimmerItem(height: 16, width: 100),
                ],
              ),
            ),
          ),
          ShimmerItem(
            height: 34,
            width: 95,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
        ],
      ),
    );
  }
}
