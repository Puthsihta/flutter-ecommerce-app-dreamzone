import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/order-detail.dart';
import 'package:dreamzone/data/models/order.dart';
import 'package:dreamzone/data/models/respones/pagination_response.dart';
import 'package:dreamzone/locator.dart';

abstract class OrderListRepo {
  Future<PaginationResponse<OrderList>> getOrderList({
    int? page,
    int? status,
  });
  Future<OrderDetail> getOrderDetail(int orderId);
  Future<bool> cancelOrder(int orderId);
}

class OrderListRepoImpl implements OrderListRepo {
  final request = locator<Dio>();

  @override
  Future<PaginationResponse<OrderList>> getOrderList(
      {int? page = 1, int? status}) async {
    final params = {
      'page': page,
      'status': status,
    };

    final mappedResponse = (await request.get(
      'order',
      queryParameters: params,
    ))
        .data as Map<String, dynamic>;
    final response =
        PaginationResponse.fromMap(mappedResponse, (e) => OrderList.fromMap(e));

    return response;
  }

  @override
  Future<OrderDetail> getOrderDetail(int orderId) async {
    final mappedResponse = (await request.get(
      'order/$orderId',
    ))
        .data as Map<String, dynamic>;
    final response = OrderDetail.fromMap(mappedResponse['data']);
    // print("response : $response");
    return response;
  }

  @override
  Future<bool> cancelOrder(int orderId) async {
    final apiResponse = (await request.put(
      'order/cancel/$orderId',
    ))
        .data as Map<String, dynamic>;
    return apiResponse["message"];
  }
}
