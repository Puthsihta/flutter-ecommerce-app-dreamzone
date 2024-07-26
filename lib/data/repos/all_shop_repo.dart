import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/respones/pagination_response.dart';
import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/locator.dart';

abstract class AllShopRepo {
  Future<PaginationResponse<Shop>> getShopList({
    int? page,
    String? search,
    int? provineId,
  });
  // Future<Product> getOrderDetail({required int orderId});
}

class AllShopRepoImpl implements AllShopRepo {
  final request = locator<Dio>();

  @override
  Future<PaginationResponse<Shop>> getShopList({
    int? page = 1,
    String? search,
    int? provineId,
  }) async {
    final params = {'page': page, 'search': search, 'provine_id': provineId};

    final mappedResponse = (await request.get(
      'shops/all-shop',
      queryParameters: params,
    ))
        .data as Map<String, dynamic>;
    final response =
        PaginationResponse.fromMap(mappedResponse, (e) => Shop.fromMap(e));

    return response;
  }
}
