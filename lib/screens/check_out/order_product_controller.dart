// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/requests/order_request.dart';
import 'package:dreamzone/data/repos/order_product_repo.dart';
import 'package:flutter/material.dart';

class OrderProductController extends ChangeNotifier {
  OrderRepo orderRepo;
  Function(int orderId)? onOrderSuccess;
  Function(dynamic message)? onOrderError;

  OrderProductController({
    required this.orderRepo,
    this.onOrderSuccess,
    this.onOrderError,
  });

  bool _loading = false;

  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Future<void> onOrderProduct(RequestOrder data) async {
    try {
      loading = true;
      final response = await orderRepo.orderProduct(data);
      if (onOrderSuccess != null) {
        onOrderSuccess!(response);
      }
    } catch (e) {
      var message = e.toString();
      if (e is DioException) {
        if (e.message != null) {
          message = e.message!;
        }
      }
      print('message : $message, ');
      onOrderError!(message);
    } finally {
      loading = false;
    }
  }
}
