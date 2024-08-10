// import 'package:real_estate/core/utils/constants.dart';
// import 'package:real_estate/core/widgets/app_message.dart';
// import 'package:flutter/material.dart';

// class MessageService {
//   const MessageService();

//   AppMessageState? get messageState => AppMessage.globalKey.currentState;

//   void custom(String message,
//       {SnackBarAction? action, Color? color, Color bgColor = kWhite}) {
//     return messageState!.custom(message, color: color, bgColor: bgColor);
//   }

//   void showMsg(BuildContext context, String message, {SnackBarAction? action}) {
//     return messageState!.showMsg(context, message, action: action);
//   }

//   void showError(BuildContext context, String message,
//       {SnackBarAction? action}) {
//     return messageState!.showError(context, message);
//   }

//   void actionableMessage({
//     required BuildContext context,
//     required String lightMsg,
//     required String boldMsg,
//     required VoidCallback action,
//     required String actionText,
//   }) {
//     messageState?.actionableMessage(
//       context: context,
//       lightMsg: lightMsg,
//       boldMsg: boldMsg,
//       action: action,
//       actionText: actionText,
//     );
//   }
// }
