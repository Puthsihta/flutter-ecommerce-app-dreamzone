import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/shop_container.dart';
import 'package:dreamzone/locator.dart';

abstract class ShopRepo {
  Future<ShopContainer> getShop();
}

class ShopRepoImpl implements ShopRepo {
  final request = locator<Dio>();

  @override
  Future<ShopContainer> getShop() async {
    final apiResponse =
        (await request.get('shops')).data as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      ShopContainer.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }
}
