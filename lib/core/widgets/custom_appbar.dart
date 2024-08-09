// ignore_for_file: prefer_const_constructors

import 'package:real_estate/core/services/navigation_service.dart';
import 'package:real_estate/core/services/service_locator.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.title,
    this.bottom,
    this.leadingItem,
    this.hasLeading = false,
    this.action,
  });

  final double? height;
  final String? title;
  final Widget? leadingItem;
  final bool hasLeading;
  final List<Widget>? action;
  final PreferredSizeWidget? bottom;

  @override
  State<CustomAppBar> createState() => CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, height ?? 54);
}

class CustomAppBarState extends State<CustomAppBar> {
  Widget? leading;

  @override
  void initState() {
    if (widget.hasLeading && widget.leadingItem == null) {
      leading = GestureDetector(
        onTap: () => app<AppNavigator>().pop(),
        child: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Icon(
                Icons.chevron_left_sharp,
                size: 30,
                color: kContrastColor,
                semanticLabel: "Back button",
              ),
            ),
            AppText("Back", size: 15, weight: FontWeight.w400),
          ],
        ),
      );
    } else {
      leading = widget.leadingItem;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      leadingWidth: 100,
      centerTitle: true,
      title: widget.title != null
          ? AppText(widget.title!, size: 15, weight: FontWeight.w600)
          : null,
      automaticallyImplyLeading: false,
      bottom: widget.bottom,
      elevation: 0,
      forceMaterialTransparency: false,
      foregroundColor: kContrastColor,
      backgroundColor: kWhite,
      actions: widget.action,
    );
  }
}
