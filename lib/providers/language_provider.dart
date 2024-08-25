import 'package:dreamzone/constants/storage_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('km'),
  ];

  Locale _locale = const Locale('en'); // Default language
  Locale get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale)) return;

    _locale = locale;
    notifyListeners();
    await saveLocaleToPrefs(locale);
  }

  Future<void> ensureInitialization() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(StorageKeys.LANG);

    if (localeCode != null && supportedLocales.contains(Locale(localeCode))) {
      _locale = Locale(localeCode);
      notifyListeners();
    }
  }

  Future<void> saveLocaleToPrefs(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.LANG, locale.languageCode);
  }

  void clearLocale() async {
    _locale = const Locale('en');
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKeys.LANG);
  }
}
