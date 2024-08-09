import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';

class InlineLoader extends StatelessWidget {
  final double size;
  final Color strokeColor;

  const InlineLoader({super.key, this.size = 20, this.strokeColor = kContrastColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 1.5,
        valueColor: AlwaysStoppedAnimation<Color?>(strokeColor),
      ),
    );
  }
}
