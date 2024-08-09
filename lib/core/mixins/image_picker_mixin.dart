// // ignore_for_file: prefer_const_constructors

// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:helproute/core/services/navigation_service.dart';
// import 'package:helproute/core/services/service_locator.dart';
// import 'package:helproute/core/utils/constants.dart';
// import 'package:helproute/core/widgets/app_button.dart';
// import 'package:helproute/core/widgets/app_text.dart';


// mixin ImagePickerOptionsMixin {
//   Future<PickerOption?> showImagePickerOption(
//     BuildContext context, {
//     String? title,
//     bool includeFile = false,
//   }) async {
//     return await showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         height: includeFile ? 480 : 400,
//         padding: EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 40),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AppText("Upload Option", weight: FontWeight.w600),
//                 CloseButton(onPressed: () => app<AppNavigator>().pop()),
//               ],
//             ),
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//               title: AppText("Take a photo", size: 15, weight: FontWeight.w500),
//               trailing: Icon(
//                 CupertinoIcons.chevron_right,
//                 size: 18,
//                 color: kContrastColor,
//               ),
//               onTap: () => Navigator.of(context).pop(PickerOption.camera),
//             ),
//             Divider(height: 5, thickness: 1),
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//               title: AppText("Choose from gallery", size: 15, weight: FontWeight.w500),
//               trailing: Icon(
//                 CupertinoIcons.chevron_right,
//                 size: 18,
//                 color: kContrastColor,
//               ),
//               onTap: () => Navigator.of(context).pop(PickerOption.gallery),
//             ),
//             Divider(height: 5, thickness: 1),
//             if (includeFile) ...[
//               ListTile(
//                 contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//                 title: AppText("Upload a file", size: 15, weight: FontWeight.w500),
//                 trailing: Icon(
//                   CupertinoIcons.chevron_right,
//                   size: 18,
//                   color: kContrastColor,
//                 ),
//                 onTap: () => Navigator.of(context).pop(PickerOption.file),
//               ),
//               Divider(height: 5, thickness: 1),
//             ],
//             Spacer(),
//             AppButton.elevated(
//               onTap: () => app<AppNavigator>().pop(),
//               // backgroundColor: kErrorColor,
//               text: "Cancel",
//             ),
//             Spacer()
//           ],
//         ),
//       ),
//     );
//   }

//   Future<XFile?> showCameraScreen({
//     required BuildContext context,
//     required CameraDescription camera,
//     required String title,
//     required String description,
//     bool? showExample,
//     bool? isLandscape,
//   }) async {
//     return await showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return TakePhotoScreen(
//           camera: camera,
//           title: title,
//           description: description,
//           showExample: showExample ?? false,
//           isLandscape: isLandscape ?? false,
//         );
//       },
//     );
//   }
// }

// enum PickerOption { camera, gallery, file }

// extension PickerOptionExt on PickerOption {
//   String get value {
//   return switch (this) {
//       PickerOption.camera => "camera",
//       PickerOption.gallery => "gallery",
//       PickerOption.file => "file",
//     };
//   }
// }
