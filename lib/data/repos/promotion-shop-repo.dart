import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/promotion_shop.dart';
import 'package:dreamzone/data/models/respones/pagination_response.dart';
import 'package:dreamzone/locator.dart';

abstract class PromotionShopRepo {
  Future<PaginationResponse<PromotionShop>> getPromotionShop({
    int? page,
  });
}

class PromotionShopRepoImpl implements PromotionShopRepo {
  final request = locator<Dio>();

  @override
  Future<PaginationResponse<PromotionShop>> getPromotionShop({
    int? page,
  }) async {
    final params = {
      'page': page,
    };

    final mappedResponse = (await request.get(
      'shops/promotion-shops',
      queryParameters: params,
    ))
        .data as Map<String, dynamic>;
    final response = PaginationResponse.fromMap(
        mappedResponse, (e) => PromotionShop.fromMap(e));

    return response;
  }
}
