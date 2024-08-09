import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';

class RequiredFieldLabel extends StatelessWidget {
  const RequiredFieldLabel({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: label, children: const [
        TextSpan(text: "*", style: TextStyle(color: kErrorColor))
      ]),
      style: const TextStyle(
          fontSize: 15, color: kContrastColor, fontWeight: FontWeight.w500),
    );
  }
}

class RequiredFieldDescLabel extends StatelessWidget {
  const RequiredFieldDescLabel(
      {Key? key, required this.label, required this.desc})
      : super(key: key);

  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(text: label, children: [
        TextSpan(text: "($desc) ", style: const TextStyle(color: kLightGreyColor)),
        const TextSpan(text: "*", style: TextStyle(color: kErrorColor))
      ]),
      style: const TextStyle(
          fontSize: 15, color: kContrastColor, fontWeight: FontWeight.w500),
    );
  }
}
