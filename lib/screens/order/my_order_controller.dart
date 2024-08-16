import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/order.dart';
import 'package:dreamzone/data/repos/order-_ist_repo.dart';
import 'package:flutter/material.dart';

class MyOrderController extends ChangeNotifier {
  final OrderListRepo orderListRepo;

  MyOrderController({
    required this.orderListRepo,
  });

  List<OrderList> _orderLists = [];
  List<OrderList> get orderLists => _orderLists;
  set orderLists(List<OrderList> newValue) {
    _orderLists = newValue;
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

  Future<void> onGetOrderList({
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
      final response = await orderListRepo.getOrderList(
        page: 1,
      );
      _orderLists = response.data;
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

      final response = await orderListRepo.getOrderList();

      if (response.data.isEmpty) {
        hasNextPage = false;
      } else {
        orderLists = [...orderLists, ...response.data];
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
