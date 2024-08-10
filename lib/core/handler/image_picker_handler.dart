// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// /// Wrapper Class for [ImagePicker]
// /// Helps to pick and crop Image.
// class ImagePickerHandler {
//   XFile? selectedFile;
//   late ImagePicker imagePicker;

//   ImagePickerHandler() : imagePicker = ImagePicker();

//   Future<CroppedFile?> pickAndCropImage(BuildContext context) async {
//     final croppedImage = await pickImage().then((_) {
//       if (context.owner != null) return cropSelectedImage(context);
//     });
//     return croppedImage;
//   }

//   Future<void> pickImage() async {
//     selectedFile = await imagePicker.pickImage(
//       source: ImageSource.gallery,
//       imageQuality: 50,
//     );
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await imagePicker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       selectedFile = response.file;
//     }
//   }

//   Future<CroppedFile?> cropSelectedImage(BuildContext context) async {
//     if (selectedFile != null) {
//       List<CropAspectRatioPreset> list = [CropAspectRatioPreset.square];
//       List<CropAspectRatioPreset> androidList =
//           list + [CropAspectRatioPreset.original];
//       List<CropAspectRatioPreset> iosList = list +
//           [
//             CropAspectRatioPreset.ratio5x3,
//             CropAspectRatioPreset.ratio5x4,
//             CropAspectRatioPreset.ratio7x5,
//           ];

//       CroppedFile? file = await ImageCropper().cropImage(
//         sourcePath: selectedFile!.path,
//         aspectRatioPresets: Platform.isAndroid ? androidList : iosList,
//         uiSettings: [
//           AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Theme.of(context).colorScheme.primary,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false,
//           ),
//           IOSUiSettings(title: 'Cropper'),
//         ],
//       );

//       return file;
//     }
//     return null;
//   }
// }

// extension CroppedFileExt on CroppedFile {
//   String get basename {
//     return path.split("/").last;
//   }
// }
