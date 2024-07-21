import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopProvider extends ChangeNotifier {
  final _preferences = SharedPreferences.getInstance();
  Shop? _shop;

  Shop? get shop => _shop;
  set shop(Shop? newShop) {
    _shop = newShop;
    notifyListeners();

    _preferences.then((prefs) {
      if (newShop != null) {
        prefs.setString(StorageKeys.SHOP_KEY, newShop.toJson());
      } else {
        prefs.remove(StorageKeys.SHOP_KEY);
      }
    });
  }

  Future<void> ensureInitialization() async {
    try {
      final sharedPrefs = await _preferences;
      final shopPrefs = sharedPrefs.getString(StorageKeys.SHOP_KEY);

      if (shopPrefs != null) {
        shop = Shop.fromJson(shopPrefs);
      } else {
        throw "Shop not defined";
      }
    } catch (e) {
      shop = null;
    }
  }
}
