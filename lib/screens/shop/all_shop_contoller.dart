import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/data/repos/all_shop_repo.dart';
import 'package:flutter/material.dart';

class AllShopScreenController extends ChangeNotifier {
  final AllShopRepo shopRepo;

  AllShopScreenController({
    required this.shopRepo,
  });

  List<Shop> _shopList = [];
  List<Shop> get shopsList => _shopList;
  set shopsList(List<Shop> newValue) {
    _shopList = newValue;
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

  int? _persistedProvince;
  int? get persistedProvince => _persistedProvince;
  set persistedProvince(int? value) {
    _persistedProvince = value;
    notifyListeners();
  }

  bool get loadingFetchNext => page > 1 && loading;
  bool get loadingInitial => page == 1 && loading;

  Future<void> onGetShop(
      {bool refresh = false, String? search, int? provineId}) async {
    if (error != null) {
      error = null;
    }
    try {
      if (!refresh) {
        loading = true;
      }
      page = 1;
      final response = await shopRepo.getShopList(
          page: 1, search: search, provineId: provineId);
      _shopList = response.data;
      if (search != null) {
        _persistedSearch = search;
        _persistedProvince = provineId;
      }
      if (response.data.isNotEmpty) {
        _hasNextPage = true;
      }
      notifyListeners();
    } catch (e) {
      _error = CustomException(e.toString());
      _persistedSearch = "";
      _persistedProvince = null;
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

      final response = await shopRepo.getShopList(
          search: _persistedSearch, page: page, provineId: _persistedProvince);

      if (response.data.isEmpty) {
        hasNextPage = false;
      } else {
        shopsList = [...shopsList, ...response.data];
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
