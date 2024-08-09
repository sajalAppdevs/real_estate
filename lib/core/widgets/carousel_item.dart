import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.top,
    required this.heading,
    required this.description,
  }) : super(key: key);

  final Widget top;
  final String heading;
  final String description;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height * 0.35,
            margin: const EdgeInsets.only(bottom: 12),
            child: top,
          ),
          HeadingText(heading),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: AppText(description, align: TextAlign.center),
          )
        ],
      ),
    );
  }
}
