import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/contact.dart';
import 'package:dreamzone/data/repos/setting_repo.dart';
import 'package:flutter/foundation.dart';

class ContactusController extends ChangeNotifier {
  final SettingRepo settingRepo;

  ContactusController({
    required this.settingRepo,
  });

  Contact? _contactUsData;
  bool loading = true;
  Contact? get contactUsData => _contactUsData;
  set contactUsData(Contact? data) {
    _contactUsData = data;
    loading = false;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  Future<void> getContactUs() async {
    try {
      final data = await settingRepo.getContactUs();
      contactUsData = data;
    } catch (e) {
      loading = false;
      if (kDebugMode) {
        print('erro get contact us : $e');
      }
      error = CustomException(e.toString());
    }
  }
}
