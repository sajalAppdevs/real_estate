import 'package:cached_network_image/cached_network_image.dart';
import 'package:real_estate/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/core/utils/extensions/extensions.dart';

// class CircularAvatar extends StatelessWidget {
//   const CircularAvatar({Key? key, this.imageUrl, this.asset}) : super(key: key);

//   final String? asset;
//   final String? imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     Widget image;
//     if (imageUrl.value.isNotEmpty) {
//       image = CachedNetworkImage(
//         imageUrl: imageUrl.value,
//         errorWidget: (context, url, error) =>
//             Image.asset(ImageAssets.onboardingImage1),
//       );
//     } else {
//       image = Image.asset(asset ?? ImageAssets.onboardingImage1);
//     }

//     return Container(
//       width: 44,
//       height: 44,
//       clipBehavior: Clip.hardEdge,
//       decoration: const BoxDecoration(shape: BoxShape.circle),
//       child: image,
//     );
//   }
// }
