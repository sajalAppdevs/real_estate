// import 'package:geolocator/geolocator.dart';

// class LocationHandler {
//   Future<LocationPermission> requestPermission() async {
//     try {
//       final locationServiceEnabled =
//           await Geolocator.isLocationServiceEnabled();
//       if (!locationServiceEnabled) {
//         throw ("Location service not enabled");
//       }
//       return await Geolocator.requestPermission();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<LocationPermission> checkPermission() async {
//     return await Geolocator.checkPermission();
//   }
// }
