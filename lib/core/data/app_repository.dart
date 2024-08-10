import 'package:real_estate/core/preferences/app_preference.dart';

class AppRepository {
  final AppPreferences preferences;

  AppRepository(this.preferences);

  // Future<bool> hasOnboarded() async {
  //   return preferences.hasBoarded;
  // }

  // Future<void> setHasBoarded() async {
  //   preferences.hasBoarded = true;
  // }
}
