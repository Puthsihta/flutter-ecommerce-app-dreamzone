import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/shop_container.dart';
import 'package:dreamzone/data/repos/shop_repo.dart';
import 'package:flutter/foundation.dart';

class ShopScreenController extends ChangeNotifier {
  final ShopRepo shopRepo;

  ShopScreenController({required this.shopRepo});

  ShopContainer? _shop;
  bool loading = true;
  ShopContainer? get shops => _shop;
  set shops(ShopContainer? data) {
    _shop = data;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  Future<void> getShop() async {
    try {
      loading = true;
      final data = await shopRepo.getShop();
      shops = data;
      loading = false;
    } catch (e) {
      error = CustomException(e.toString());
      notifyListeners();
    } finally {
      loading = false;
    }
  }
}
