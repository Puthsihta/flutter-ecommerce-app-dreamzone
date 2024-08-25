import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/setting.dart';
import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:flutter/foundation.dart';

class SettingController extends ChangeNotifier {
  final SettingRepo settingRepo;

  SettingController({
    required this.settingRepo,
  });

  Setting? _settingData;
  bool loading = true;
  Setting? get settingData => _settingData;
  set settingData(Setting? data) {
    _settingData = data;
    loading = false;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  Future<void> getSetting(String type) async {
    try {
      final data = await settingRepo.getSetting(type);
      settingData = data;
    } catch (e) {
      loading = false;
      if (kDebugMode) {
        print('erro get setting : $e');
      }
      error = CustomException(e.toString());
    }
  }
}
