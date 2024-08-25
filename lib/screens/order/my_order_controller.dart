import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/order.dart';
import 'package:dreamzone/data/repos/order-_ist_repo.dart';
import 'package:flutter/material.dart';

enum HomeStatus { initial, success, error }

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

  HomeStatus _status = HomeStatus.initial;
  HomeStatus get status => _status;
  set status(HomeStatus newValue) {
    _status = newValue;
    notifyListeners();
  }

  bool _hasReachedMax = false;
  bool get hasReachedMax => _hasReachedMax;
  set hasReachedMax(bool newValue) {
    _hasReachedMax = newValue;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  late int _perPage;

  Future<void> getOrderList({bool refresh = false}) async {
    try {
      if (_status == HomeStatus.initial || refresh == true) {
        final respone = await orderListRepo.getOrderList(page: 1);
        status = HomeStatus.success;
        orderLists = respone.data;
        hasReachedMax = respone.data.length == respone.pagination.limit!;
        _perPage = respone.pagination.limit!;
      } else {
        if (hasReachedMax == false) return;
        int page = (_orderLists.length / _perPage).ceil();
        final respone = await orderListRepo.getOrderList(page: page + 1);
        status = HomeStatus.success;
        if (_orderLists.length < respone.pagination.total!) {
          orderLists = [..._orderLists, ...respone.data];
          hasReachedMax = respone.data.length == respone.pagination.limit!;
        }
      }
    } catch (e) {
      status = HomeStatus.error;
      error = CustomException(e.toString());
    }
  }
}
