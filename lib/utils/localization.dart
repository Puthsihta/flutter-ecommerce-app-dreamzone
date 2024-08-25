import 'package:dreamzone/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

class LocalizationService {
  static final LocalizationService _instance = LocalizationService._internal();

  late AppLocalizations _localizations;

  factory LocalizationService() {
    return _instance;
  }

  LocalizationService._internal();

  void loadLocalization(BuildContext context) {
    _localizations = AppLocalizations.of(context)!;
  }

  AppLocalizations get localizations => _localizations;
}
