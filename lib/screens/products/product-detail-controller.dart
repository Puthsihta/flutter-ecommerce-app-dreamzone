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
  bool favLoading = false;
  ProductDetailContainer? get productDetail => _productDetail;
  set productDetail(ProductDetailContainer? home) {
    _productDetail = home;
    loading = false;
    notifyListeners();
  }

  Future<void> onFavoriteProduct(int productId) async {
    try {
      favLoading = true;
      await productDetialRepo.onFavoriteProduct(productId);
      favLoading = false;
      getProductDetail(productId);
    } catch (e) {
      favLoading = false;
      notifyListeners();
      if (kDebugMode) {
        print('Error on favorite product : $e');
      }
    }
  }

  Future<void> getProductDetail(int productId) async {
    try {
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
