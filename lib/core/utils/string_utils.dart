import 'package:real_estate/core/utils/extensions/extensions.dart';

class StrUtil {
  static const int _upperCaseA = 0x41;
  static const int _upperCaseZ = 0x5a;
  // static final int _lowerCaseA = 0x61;
  // static final int _lowerCaseZ = 0x7a;
  // static final int _asciiCaseBit = 0x20;

  static String toCamelCase(String? source) {
    if (source.value.isEmpty) return source.value;
    source = source.value.toLowerCase();
    final entries = source.split('').map((i) => i.codeUnitAt(0)).toList();
    final words = <String>[];
    for (var i = 0; i < entries.length; i++) {
      final entry = entries.elementAt(i);
      if (i == 0) {
        words.add(String.fromCharCode(entry).toUpperCase());
        continue;
      }

      if (String.fromCharCode(entries[i - 1]) == " ") {
        words.add(String.fromCharCode(entry).toUpperCase());
        continue;
      }

      if (isUpperCase(entry)) {
        words.add(" ");
      }

      words.add(String.fromCharCode(entry));
    }
    return words.join().toString();
  }

  static String toTitleCase(String source) {
    if (source.isEmpty) return source;
    source = source.toLowerCase();
    final entries = source.split('').map((i) => i.codeUnitAt(0)).toList();
    final words = <String>[];
    for (var i = 0; i < entries.length; i++) {
      final entry = entries.elementAt(i);
      if (i == 0) {
        words.add(String.fromCharCode(entry).toUpperCase());
        continue;
      }

      if (isUpperCase(entry)) {
        words.add(" ");
      }

      words.add(String.fromCharCode(entry));
    }
    return words.join().toString();
  }

  static bool isUpperCase(int entry) =>
      entry >= _upperCaseA && entry <= _upperCaseZ;
}
