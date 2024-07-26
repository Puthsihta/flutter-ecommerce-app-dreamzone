import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/shop_detail.dart';
import 'package:dreamzone/locator.dart';

abstract class ShopDetailRepo {
  Future<ShopContainDetail> getShopDetail(int shopId);
}

class ShopDetailRepoImpl implements ShopDetailRepo {
  final request = locator<Dio>();

  @override
  Future<ShopContainDetail> getShopDetail(int shopId) async {
    final apiResponse =
        (await request.get('shops/$shopId')).data as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      ShopContainDetail.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }
}
