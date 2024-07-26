import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/repos/product_repo.dart';
import 'package:flutter/material.dart';

class ProductScreenController extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductScreenController({
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

  String _persistedSearch = "";
  String get persistedSearch => _persistedSearch;
  set persistedSearch(String value) {
    _persistedSearch = value;
    notifyListeners();
  }

  int? _persistedShopId;
  int? get persistedProvince => _persistedShopId;
  set persistedProvince(int? value) {
    _persistedShopId = value;
    notifyListeners();
  }

  int? _persistedCateId;
  int? get persistedCateId => _persistedCateId;
  set persistedCateId(int? value) {
    _persistedCateId = value;
    notifyListeners();
  }

  int? _persistedSubCateId;
  int? get persistedSubCateId => _persistedSubCateId;
  set persistedSubCateId(int? value) {
    _persistedSubCateId = value;
    notifyListeners();
  }

  bool get loadingFetchNext => page > 1 && loading;
  bool get loadingInitial => page == 1 && loading;

  Future<void> onGetProduct({
    bool refresh = false,
    String? search,
    int? shopId,
    int? cateId,
    int? subCateId,
  }) async {
    if (error != null) {
      error = null;
    }
    try {
      if (!refresh) {
        loading = true;
      }
      page = 1;
      final response = await productRepo.getProductList(
        page: 1,
        search: search,
        shopId: shopId,
        cateId: cateId,
        subCateId: subCateId,
      );
      _productList = response.data;
      if (search != null) {
        _persistedSearch = search;
        _persistedShopId = shopId;
        _persistedCateId = cateId;
        _persistedSubCateId = subCateId;
      }
      if (response.data.isNotEmpty) {
        _hasNextPage = true;
      }
      notifyListeners();
    } catch (e) {
      _error = CustomException(e.toString());
      _persistedSearch = "";
      _persistedShopId = null;
      _persistedCateId = null;
      _persistedSubCateId = null;
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

      final response = await productRepo.getProductList(
        search: _persistedSearch,
        page: page,
        shopId: _persistedShopId,
        cateId: _persistedCateId,
        subCateId: _persistedSubCateId,
      );

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
