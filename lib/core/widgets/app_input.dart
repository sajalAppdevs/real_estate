import 'package:real_estate/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.hint,
    this.height,
    this.onChange,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.focus,
    this.inputAction,
    this.inputType,
    this.suffix,
    this.prefix,
    this.obscure = false,
    this.hasError = false,
    this.textSize,
    this.borderRadius,
    this.focusNode,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;

  final String? hint;
  final bool? focus;
  final bool obscure;
  final bool hasError;
  final int maxLines;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final Function(String?)? onChange;
  final Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final Widget? prefix;
  final double? textSize;
  final BorderRadius? borderRadius;
  final double? height;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      height: widget.height ?? 48,
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        onChanged: widget.onChange,
        obscureText: widget.obscure,
        maxLines: widget.maxLines,
        onFieldSubmitted: widget.onFieldSubmitted,
        cursorHeight: 18,
        cursorColor: kContrastColor,
        scrollPadding: EdgeInsets.zero,
        style: TextStyle(
          color: kDarkTextColor,
          fontSize: widget.textSize ?? 15,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,
          suffixStyle: const TextStyle(color: kDarkTextColor),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
          hintStyle: TextStyle(
            color: kIndicatorColor,
            fontSize: widget.textSize ?? 15,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? kBorderRadius,
            borderSide: const BorderSide(color: kStrokeColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? kBorderRadius,
            borderSide: const BorderSide(color: kContrastColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? kBorderRadius,
            borderSide: const BorderSide(color: kErrorColor, width: 1.5),
          ),
        ).applyDefaults(const InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        )),
      ),
    );
  }
}
