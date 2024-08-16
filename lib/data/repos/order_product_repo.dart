import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/requests/order_request.dart';
import 'package:dreamzone/locator.dart';

abstract class OrderRepo {
  Future<bool> orderProduct(RequestOrder request);
}

class OrderRepoImpl implements OrderRepo {
  final client = locator<Dio>();

  @override
  Future<bool> orderProduct(RequestOrder request) async {
    final apiResponse = (await client.post('order', data: request.toMap())).data
        as Map<String, dynamic>;
    return apiResponse["message"];
  }
}
