import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/payment_method.dart';
import 'package:dreamzone/data/models/respones/list_respone.dart';
import 'package:dreamzone/locator.dart';

abstract class PaymentMethodRepo {
  Future<ListRespone<PaymentMethod>> getPaymentMethod();
}

class PaymentMethodRepoImpl extends PaymentMethodRepo {
  final request = locator<Dio>();

  @override
  Future<ListRespone<PaymentMethod>> getPaymentMethod() async {
    final mappedResponse = (await request.get(
      'payment-method',
    ))
        .data as Map<String, dynamic>;
    final response = ListRespone.fromMap(
      mappedResponse,
      (e) => PaymentMethod.fromMap(e),
    );

    return response;
  }
}
