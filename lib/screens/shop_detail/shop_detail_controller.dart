import 'package:dreamzone/data/models/shop_detail.dart';
import 'package:dreamzone/data/repos/shop_detail_repo.dart';
import 'package:flutter/foundation.dart';

class ShopDetailController extends ChangeNotifier {
  final ShopDetailRepo shopDetialRepo;

  ShopDetailController({
    required this.shopDetialRepo,
  });

  ShopContainDetail? _shopDetail;
  bool loading = true;
  ShopContainDetail? get shopDetail => _shopDetail;
  set shopDetail(ShopContainDetail? data) {
    _shopDetail = data;
    loading = false;
    notifyListeners();
  }

  Future<void> getShopDetail(int shopId) async {
    try {
      loading = true;
      final data = await shopDetialRepo.getShopDetail(shopId);
      shopDetail = data;
    } catch (e) {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        print('erro get shop detail : $e');
      }
    }
  }
}
