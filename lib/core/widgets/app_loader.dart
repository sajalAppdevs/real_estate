import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/inline_loader.dart';
import 'package:flutter/material.dart';

class Loader {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      builder: (BuildContext context) => Center(
        child: Container(
          width: 60.0,
          height: 60.0,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
          child: const InlineLoader(strokeColor: kBlack),
        ),
      ),
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.pop(context, true);
  }
}
