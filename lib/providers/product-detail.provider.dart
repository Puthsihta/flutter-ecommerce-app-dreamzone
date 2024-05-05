import 'package:dreamzone/models/product-detail.model.dart';
import 'package:dreamzone/services/product-detail.service.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  ProductDetailService productDetailService = ProductDetailService();
  bool isLoading = false;
  // Product? productDetail;
  // List<RelatedProduct> relatedProduct = [];

  Future<void> getProductDetail(int id) async {
    isLoading = true;
    notifyListeners();

    final respone = await productDetailService.getProductDetail(id);
    // print(respone);
    // productDetail = respone.data!.product;
    // relatedProduct = respone.data!.relatedProduct!.toList();

    isLoading = false;
    notifyListeners();
  }
}
