import 'package:dreamzone/data/models/payment_method.dart';
import 'package:dreamzone/data/repos/payment_method_repo.dart';
import 'package:flutter/foundation.dart';

class PaymentMethodController extends ChangeNotifier {
  final PaymentMethodRepo paymentMethodController;

  PaymentMethodController({
    required this.paymentMethodController,
  });

  bool loading = true;
  List<PaymentMethod>? _paymentMethodData;
  PaymentMethod? _paymentMethod;
  List<PaymentMethod>? get paymenthMethod => _paymentMethodData;
  PaymentMethod? get selectedPaymentMethod => _paymentMethod;
  set paymenthMethod(List<PaymentMethod>? data) {
    _paymentMethodData = data;
    loading = false;
    notifyListeners();
  }

  set selectedPaymentMethod(PaymentMethod? method) {
    _paymentMethod = method;
    notifyListeners();
  }

  Future<void> getPaymentMethod() async {
    try {
      final data = await paymentMethodController.getPaymentMethod();
      paymenthMethod = data.data;
    } catch (e) {
      loading = false;
      notifyListeners();
      if (kDebugMode) {
        print('erro get paymentmethod : $e');
      }
    }
  }
}
