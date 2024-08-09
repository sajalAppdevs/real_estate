import 'package:real_estate/core/preferences/app_preference.dart';
import 'package:real_estate/core/preferences/auth_preference.dart';
import 'package:real_estate/core/services/message_service.dart';
import 'package:real_estate/core/services/navigation_service.dart';
import 'package:real_estate/core/services/preference_service.dart';
import 'package:get_it/get_it.dart';

final app = GetIt.instance;

/// Adds all globally available services to service locator
Future<void> setupServices() async {
  app
    ..registerLazySingleton(() => PreferenceService())
    ..registerLazySingleton(() => AppNavigator())
    ..registerLazySingleton(() => const MessageService())
    ..registerLazySingleton(() => AuthPreferences())
    ..registerLazySingleton(() => const AppPreferences());

  await app<PreferenceService>().initialize();
}
