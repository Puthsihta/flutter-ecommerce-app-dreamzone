import 'package:dreamzone/data/models/product_detail.dart';
import 'package:dreamzone/data/repos/product_detail_repo.dart';
import 'package:flutter/foundation.dart';

class ProductDetailController extends ChangeNotifier {
  final ProductDetialRepo productDetialRepo;

  ProductDetailController({
    required this.productDetialRepo,
  });

  ProductDetailContainer? _productDetail;
  bool loading = true;
  ProductDetailContainer? get productDetail => _productDetail;
  set productDetail(ProductDetailContainer? home) {
    _productDetail = home;
    loading = false;
    notifyListeners();
  }

  Future<void> getProductDetail(int productId) async {
    try {
      loading = true;
      final data = await productDetialRepo.getProductDetail(productId);
      productDetail = data;
    } catch (e) {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        print('erro get product detail : $e');
      }
    }
  }
}
