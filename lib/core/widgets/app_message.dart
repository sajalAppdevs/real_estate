import 'package:another_flushbar/flushbar.dart';
import 'package:real_estate/core/utils/constants.dart';
import 'package:real_estate/core/widgets/app_button.dart';
import 'package:real_estate/core/widgets/app_text.dart';
import 'package:flutter/material.dart';

/// Wraps the [child] with a [Scaffold] and [ScaffoldMessenger] to show
/// [SnackBar]s from anywhere in the app using the [globalKey].
class AppMessage extends StatefulWidget {
  AppMessage({
    required this.child,
  }) : super(key: globalKey);

  final Widget child;

  static final globalKey = GlobalKey<AppMessageState>();

  @override
  AppMessageState createState() => AppMessageState();
}

class AppMessageState extends State<AppMessage> {
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  ScaffoldMessengerState? get state => _messengerKey.currentState;

  void custom(String message,
      {SnackBarAction? action, Color? color, Color? bgColor}) {
    final height = MediaQuery.of(context).size.height;

    _messengerKey.currentState?.removeCurrentSnackBar();
    _messengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: bgColor ?? kErrorColor,
        duration: const Duration(seconds: 5),
        content: AppText(
          message,
          align: TextAlign.center,
          color: color ?? kContrastColor,
          size: 14,
          weight: FontWeight.w600,
        ),
        action: action,
        shape: const RoundedRectangleBorder(),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: height - (height * .14),
        ),
      ),
    );
  }

  void showMsg(BuildContext context, String message, {SnackBarAction? action}) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 5),
      messageText: AppText(
        message,
        size: 14,
        weight: FontWeight.w500,
        color: kContrastColor,
        align: TextAlign.center,
      ),
      backgroundColor: kWhite,
      boxShadows: const [
        BoxShadow(offset: Offset(0, 3), blurRadius: 3.0, color: Colors.black12)
      ],
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      isDismissible: true,
    ).show(context);
  }

  void showError(BuildContext context, String message,
      {SnackBarAction? action}) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 5),
      messageText: AppText(
        message,
        size: 14,
        weight: FontWeight.w500,
        color: kWhite,
        align: TextAlign.center,
      ),
      backgroundColor: kErrorColor,
      boxShadows: const [
        BoxShadow(offset: Offset(0, 3), blurRadius: 3.0, color: Colors.black12)
      ],
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      isDismissible: true,
    ).show(context);
  }

  void actionableMessage({
    required BuildContext context,
    required String lightMsg,
    required String boldMsg,
    required VoidCallback action,
    required String actionText,
  }) {
    Flushbar(
      duration: const Duration(milliseconds: 3500),
      message: '',
      messageText: Text.rich(
        TextSpan(
          text: lightMsg,
          children: [
            TextSpan(
                text: boldMsg, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        style: const TextStyle(
            fontWeight: FontWeight.w500, fontSize: 14, color: kContrastColor),
      ),
      backgroundColor: kWhite,
      mainButton: SizedBox(
          width: 92,
          height: 44,
          child: AppButton.elevated(onTap: action, text: actionText)),
      boxShadows: const [
        BoxShadow(offset: Offset(0, 3), blurRadius: 3.0, color: Colors.black12)
      ],
      flushbarStyle: FlushbarStyle.GROUNDED,
      flushbarPosition: FlushbarPosition.TOP,
      isDismissible: true,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double factor = size.height <= 700 ? 0.85 : 1;
    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: factor),
          child: widget.child,
        ),
      ),
    );
  }
}
