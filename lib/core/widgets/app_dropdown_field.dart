import 'package:real_estate/core/logger/init_logger.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class AppDropdownField extends StatefulWidget {
  const AppDropdownField({
    Key? key,
    this.hint,
    this.onChange,
    this.suffix,
    this.obscure = false,
    this.hasError = false,
    required this.controller,
    required this.dropdowns,
  }) : super(key: key);

  final SingleValueDropDownController controller;

  final String? hint;
  final bool obscure;
  final bool hasError;
  final Function(String?)? onChange;
  final Widget? suffix;
  final List<String> dropdowns;

  @override
  State<AppDropdownField> createState() => _AppDropdownFieldState();
}

class _AppDropdownFieldState extends State<AppDropdownField> with AppLogger {
  TextStyle get _textStyle => const TextStyle(
      color: kContrastColor, fontSize: 14, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: DropDownTextField(
        listSpace: -8,
        clearOption: false,
        textStyle: _textStyle,
        listTextStyle: _textStyle,
        listPadding: ListPadding(bottom: 12, top: 8),
        dropDownList: widget.dropdowns
            .map((item) => DropDownValueModel(name: item, value: item))
            .toList(),
        textFieldDecoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: widget.suffix,
          suffixStyle: const TextStyle(color: kContrastColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          hintStyle: const TextStyle(
              color: kIndicatorColor,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          border: const OutlineInputBorder(
            borderRadius: kBorderRadius,
            borderSide: BorderSide(color: kStrokeColor, width: 1.5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: kBorderRadius,
            borderSide: BorderSide(color: kContrastColor, width: 1.5),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: kBorderRadius,
            borderSide: BorderSide(color: kErrorColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
