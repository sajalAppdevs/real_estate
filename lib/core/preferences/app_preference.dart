import 'package:real_estate/core/services/preference_service.dart';
import 'package:real_estate/core/services/service_locator.dart';

class AppPreferences {
  const AppPreferences();

  bool get hasBoarded => app<PreferenceService>().getBool('hasBoarded', false);

  set hasBoarded(bool value) =>
      app<PreferenceService>().setBool('hasBoarded', value);

  bool get biometricsEnabled =>
      app<PreferenceService>().getBool('biometricsEnabled', false);

  set biometricsEnabled(bool value) =>
      app<PreferenceService>().setBool('biometricsEnabled', value);

  bool get notificationsEnabled =>
      app<PreferenceService>().getBool('notificationsEnabled', false);

  set notificationsEnabled(bool value) {
    app<PreferenceService>().setBool('notificationsEnabled', value);
  }

  bool get locationsEnabled =>
      app<PreferenceService>().getBool('locationsEnabled', false);

  set locationsEnabled(bool value) =>
      app<PreferenceService>().setBool('locationsEnabled', value);

  String get onboardingLastRoute =>
      app<PreferenceService>().getString('onboardingLastRoute', '');

  set onboardingLastRoute(String value) {
    app<PreferenceService>().setString('onboardingLastRoute', value);
  }

  bool get hasViewedCollaboration =>
      app<PreferenceService>().getBool('hasViewedCollaboration', false);

  set hasViewedCollaboration(bool value) =>
      app<PreferenceService>().setBool('hasViewedCollaboration', value);

  bool get hasViewedPaymentInfo =>
      app<PreferenceService>().getBool('hasViewedPaymentInfo', false);

  set hasViewedPaymentInfo(bool value) =>
      app<PreferenceService>().setBool('hasViewedPaymentInfo', value);

  void clearAppPref() {
    app<PreferenceService>().clear();
    hasBoarded = true;
  }
}
