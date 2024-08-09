import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_input.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class InputGroup extends StatefulWidget {
  const InputGroup({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.onFieldSubmitted,
    this.onChange,
    this.focusNode,
    this.type,
    this.action,
    this.suffix,
    this.prefix,
    this.error,
    this.size,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? error;
  final Widget? suffix;
  final Widget? prefix;
  final double? size;
  final FocusNode? focusNode;
  final TextInputType? type;
  final TextInputAction? action;
  final Function(String?)? onChange;
  final Function(String)? onFieldSubmitted;

  @override
  State<InputGroup> createState() => _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: AppText(widget.label, size: 16, weight: FontWeight.w400),
        ),
        AppTextField(
          controller: widget.controller,
          hint: widget.hint,
          suffix: widget.suffix,
          prefix: widget.prefix,
          textSize: widget.size,
          inputType: widget.type,
          onChange: widget.onChange,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
        if (widget.error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: AppText(
              widget.error!,
              size: 15,
              color: kErrorColor,
              weight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}

class RequiredInputGroup extends StatefulWidget {
  const RequiredInputGroup({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.onFieldSubmitted,
    this.onChange,
    this.focusNode,
    this.type,
    this.action,
    this.suffix,
    this.prefix,
    this.error,
    this.size,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hint;
  final String? error;
  final Widget? suffix;
  final Widget? prefix;
  final double? size;
  final FocusNode? focusNode;
  final TextInputType? type;
  final TextInputAction? action;
  final Function(String?)? onChange;
  final Function(String)? onFieldSubmitted;

  @override
  State<RequiredInputGroup> createState() => _RequiredInputGroupState();
}

class _RequiredInputGroupState extends State<RequiredInputGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          child: Text.rich(
            TextSpan(
              text: "${widget.label} ",
              style: const TextStyle(
                color: kContrastColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              children: const [
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: kErrorColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        AppTextField(
          controller: widget.controller,
          hint: widget.hint,
          suffix: widget.suffix,
          prefix: widget.prefix,
          textSize: widget.size,
          inputType: widget.type,
          onChange: widget.onChange,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
        if (widget.error != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: AppText(
              widget.error!,
              size: 15,
              color: kErrorColor,
              weight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
