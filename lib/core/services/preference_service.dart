import 'package:shared_preferences/shared_preferences.dart';
import 'package:real_estate/core/core.dart';

/// Wraps the [SharedPreferences]
class PreferenceService with AppLogger {
  late SharedPreferences _preferences;

  /// Can be used to prefix the given key
  ///
  /// Used to differentiate user preferences
  String? prefix;

  /// Initializes the [_preferences] instance
  Future<void> initialize() async {
    log.i('initializing app preferences');
    _preferences = await SharedPreferences.getInstance();
  }

  String _key(String key, bool usePrefix) {
    if (usePrefix && prefix != null && prefix!.isNotEmpty == true) {
      return '$prefix.$key';
    } else {
      return key;
    }
  }

  /// Gets the int value for the [key] if it exists.
  ///
  /// Limits the value if [lowerLimit] and [upperLimit] are not null
  int getInt(String key, int defaultValue,
      {bool prefix = false, int? lowerLimit, int? upperLimit}) {
    try {
      final value = _preferences.getInt(_key(key, prefix)) ?? defaultValue;

      if (lowerLimit != null && upperLimit != null) {
        return value.clamp(lowerLimit, upperLimit);
      }
      return value;
    } catch (e) {
      return defaultValue;
    }
  }

  void setInt(String key, int value, {bool prefix = false}) async {
    log.i('set ${_key(key, prefix)} to $value');
    await _preferences.setInt(_key(key, prefix), value);
  }

  /// Gets the int value for the [key] if it exists.
  ///
  /// Limits the value if [lowerLimit] and [upperLimit] are not null
  double getDouble(String key, double defaultValue,
      {bool prefix = false, double? lowerLimit, double? upperLimit}) {
    try {
      final value = _preferences.getDouble(_key(key, prefix)) ?? defaultValue;

      if (lowerLimit != null && upperLimit != null) {
        return value.clamp(lowerLimit, upperLimit);
      }
      return value;
    } catch (e) {
      return defaultValue;
    }
  }

  void setDouble(String key, double value, {bool prefix = false}) async {
    log.i('set ${_key(key, prefix)} to $value');
    await _preferences.setDouble(_key(key, prefix), value);
  }

  /// Gets the bool value for the [key] if it exists
  bool getBool(String key, bool defaultValue, {bool prefix = false}) {
    try {
      return _preferences.getBool(_key(key, prefix)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  void setBool(String key, bool value, {bool prefix = false}) async {
    log.i('set ${_key(key, prefix)} to $value');
    await _preferences.setBool(_key(key, prefix), value);
  }

  String getString(String key, String defaultValue, {bool prefix = false}) {
    try {
      return _preferences.getString(_key(key, prefix)) ?? defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  void setString(String key, String value, {bool prefix = false}) async {
    log.i('set ${_key(key, prefix)} to $value');
    await _preferences.setString(_key(key, prefix), value);
  }

  /// Gets the string list for the [key] or an empty list if it doesn't exist
  List<String> getStringList(String key, {bool prefix = false}) {
    try {
      return _preferences.getStringList(_key(key, prefix)) ?? [];
    } catch (e) {
      return [];
    }
  }

  void setStringList(String key, List<String> value,
      {bool prefix = false}) async {
    log.i('set ${_key(key, prefix)} to $value');
    await _preferences.setStringList(_key(key, prefix), value);
  }

  void remove(String key, {bool prefix = false}) async {
    log.i('remove ${_key(key, prefix)}');
    await _preferences.remove(_key(key, prefix));
  }

  void clear() {
    _preferences.clear();
  }
}
