import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/repos/product_repo.dart';
import 'package:flutter/material.dart';

class ProductFavoriteController extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductFavoriteController({
    required this.productRepo,
  });

  List<Product> _productList = [];
  List<Product> get products => _productList;
  set products(List<Product> newValue) {
    _productList = newValue;
    notifyListeners();
  }

  bool _loading = true;
  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
    notifyListeners();
  }

  bool _hasNextPage = false;
  bool get hasNextPage => _hasNextPage;
  set hasNextPage(bool value) {
    _hasNextPage = value;
    notifyListeners();
  }

  bool get loadingFetchNext => page > 1 && loading;
  bool get loadingInitial => page == 1 && loading;

  Future<void> onGetFavoriteProduct({
    bool refresh = false,
  }) async {
    if (error != null) {
      error = null;
    }
    try {
      if (!refresh) {
        loading = true;
      }
      page = 1;
      final response = await productRepo.getFavoriteProduct(
        page: 1,
      );
      _productList = response.data;
      if (response.data.isNotEmpty) {
        _hasNextPage = true;
      }
      notifyListeners();
    } catch (e) {
      _error = CustomException(e.toString());
      notifyListeners();
    } finally {
      loading = false;
    }
  }

  Future<void> onFetchNextPage() async {
    if (!hasNextPage || loadingFetchNext) return;

    try {
      _loading = true;
      _page = page + 1;
      notifyListeners();

      final response = await productRepo.getProductList();

      if (response.data.isEmpty) {
        hasNextPage = false;
      } else {
        products = [...products, ...response.data];
      }
    } catch (e) {
      _error = CustomException(e.toString());
      _page = 1;
      _hasNextPage = false;
      notifyListeners();
    } finally {
      loading = false;
    }
  }
}
