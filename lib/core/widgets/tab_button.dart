import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_button.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabButton extends StatelessWidget {
  /// The text widget of the button.
  ///
  /// Can be `null` if the button has no text.
  final String? text;

  /// The icon widget of the button.
  ///
  /// Can be `null` if the button has no icon.
  final Widget? icon;

  /// If button icon should display after button text
  /// defaults to false
  final bool isIconAfterText;

  /// The size of the [icon].
  ///
  /// Defaults to the current icon theme's size.
  final double? iconSize;

  /// The size of the [text].
  ///
  /// Defaults to 15.
  final double? fontSize;

  /// This weight of the [text]
  ///
  /// Defaults to FontWeight.w600
  final FontWeight? weight;

  ///
  /// Shows progress indicator when set to true.
  final bool isLoading;

  /// The callback when the button is tapped.
  ///
  /// If `null`, the button has reduced transparency to appear disabled.
  final VoidCallback onTap;

  /// Specifies the type of button, either Raised, Outlined or Flat.
  ///
  /// Uses global button theme.
  final ButtonType buttonType;

  /// The color of the button.
  ///
  /// Uses the [AppTheme.foregroundColor] if `null`.
  final Color? backgroundColor;

  /// The color of the [icon] and [text] of the button.
  ///
  /// Defaults to [kContrastColor] if the [backgroundColor] is `null`,
  /// to the text foreground color if the [backgroundColor] is transparent or to
  /// white or black when [backgroundColor] is set.
  final Color? foregroundColor;

  /// Button text style.
  final TextStyle? style;

  /// Whether the button should have less padding.
  ///
  /// Has no effect if [padding] is not `null`.
  final bool dense;

  /// The padding for the button.
  ///
  /// Should usually be `null` to use the default padding that is controlled
  /// with [dense] if a smaller padding is required.
  final EdgeInsets? padding;

  /// The padding between the [icon] and [text].
  ///
  /// Only has an affect when both [icon] and [text] is not `null`.
  ///
  /// Defaults to half of the vertical padding.
  final double? betweenPadding;

  /// The [elevation] that changes when using a [AppButton.flat] or
  /// [AppButton.raised].
  final double elevation;

  /// Specifies [width] of button
  final double? width;

  /// Specifies [height] of button
  final double? height;

  /// Specifies [borderRadius] of button
  final double? borderRadius;

  /// Specifies [ShadowColor] of button
  final Color? shadowColor;

  const TabButton({
    super.key,
    this.text,
    this.icon,
    this.isIconAfterText = false,
    this.iconSize,
    this.fontSize,
    this.weight,
    this.isLoading = false,
    this.buttonType = ButtonType.elevated,
    this.backgroundColor,
    this.foregroundColor,
    this.style,
    this.dense = false,
    this.padding,
    this.betweenPadding,
    this.elevation = 0,
    this.width,
    this.height,
    this.borderRadius,
    this.shadowColor,
    required this.onTap,
  });

  bool get isOutline => buttonType == ButtonType.outline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () => {HapticFeedback.mediumImpact(), onTap()},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: isOutline ? Border.all(color: kStrokeColor) : null,
          borderRadius: BorderRadius.circular(48),
          color: isOutline ? null : kContrastColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(padding: const EdgeInsets.only(right: 12.0), child: icon!),
            AppText(
              text!,
              size: 13,
              weight: FontWeight.w600,
              color: isOutline ? kContrastColor : kWhite,
            )
          ],
        ),
      ),
    );
  }
}
