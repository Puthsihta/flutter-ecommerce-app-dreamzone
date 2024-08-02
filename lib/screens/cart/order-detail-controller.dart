import 'package:dreamzone/data/models/order-detail.dart';
import 'package:dreamzone/data/repos/order-list-repo.dart';
import 'package:flutter/foundation.dart';

class OrderDetailController extends ChangeNotifier {
  final OrderListRepo orderListRepo;

  OrderDetailController({
    required this.orderListRepo,
  });

  OrderDetail? _orderDetail;
  bool loading = true;
  bool favLoading = false;
  OrderDetail? get orderDetail => _orderDetail;
  set orderDetail(OrderDetail? home) {
    _orderDetail = home;
    loading = false;
    notifyListeners();
  }

  Future<void> onCancelOrder(int orderId) async {
    try {
      favLoading = true;
      notifyListeners();
      final respone = await orderListRepo.cancelOrder(orderId);
      if (respone) {
        favLoading = false;
        getOrderDetail(orderId);
      }
    } catch (e) {
      favLoading = false;
      notifyListeners();
      if (kDebugMode) {
        print('Error on favorite product : $e');
      }
    }
  }

  Future<void> getOrderDetail(int orderId) async {
    try {
      final data = await orderListRepo.getOrderDetail(orderId);
      orderDetail = data;
    } catch (e) {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        print('erro get order detail : $e');
      }
    }
  }
}
