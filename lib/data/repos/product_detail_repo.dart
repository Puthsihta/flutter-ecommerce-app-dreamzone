import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/product_detail.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/locator.dart';

abstract class ProductDetialRepo {
  Future<ProductDetailContainer> getProductDetail(int productId);
}

class ProductDetialRepoImpl implements ProductDetialRepo {
  final request = locator<Dio>();

  @override
  Future<ProductDetailContainer> getProductDetail(int productId) async {
    final apiResponse =
        (await request.get('products/$productId')).data as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      ProductDetailContainer.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }
}
