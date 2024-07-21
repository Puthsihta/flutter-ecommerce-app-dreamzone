import 'package:dreamzone/constants/storage_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  final prefs = SharedPreferences.getInstance();

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> onThemeChanged(ThemeMode mode) async {
    final sharedPrefs = await prefs;
    sharedPrefs.setInt(StorageKeys.THEME_KEY, mode.index);
  }

  ThemeMode getThemeMode(int? index) {
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  set themeMode(ThemeMode value) {
    _themeMode = value;
    onThemeChanged(value);
    notifyListeners();
  }

  Future<void> ensureInitialization() async {
    try {
      final sharedPrefs = await prefs;
      final themePrefs = sharedPrefs.getInt(StorageKeys.THEME_KEY);
      themeMode = getThemeMode(themePrefs);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
  }
}
