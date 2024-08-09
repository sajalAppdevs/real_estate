import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';

class LoadingModal extends StatelessWidget {
  const LoadingModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Center(
        child: Container(
          width: 80,
          height: 80,
          constraints: const BoxConstraints(maxHeight: 80, maxWidth: 80),
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Center(
            child: CircularProgressIndicator(
                color: kContrastColor, strokeWidth: 2),
          ),
        ),
      );
    });
  }
}
