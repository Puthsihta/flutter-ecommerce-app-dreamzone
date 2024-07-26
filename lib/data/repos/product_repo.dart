import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/data/models/respones/pagination_response.dart';
import 'package:dreamzone/locator.dart';

abstract class ProductRepo {
  Future<PaginationResponse<Product>> getProductList({
    int? page,
    String? search,
    int? shopId,
    int? cateId,
    int? subCateId,
  });
}

class ProductRepoImpl implements ProductRepo {
  final request = locator<Dio>();

  @override
  Future<PaginationResponse<Product>> getProductList({
    int? page = 1,
    String? search,
    int? shopId,
    int? cateId,
    int? subCateId,
  }) async {
    final params = {
      'page': page,
      'search': search,
      'shop_id': shopId,
      'cate_id': cateId,
      'sub_cate_id': subCateId,
    };

    // print("page inrepo: $page");

    final mappedResponse = (await request.get(
      'products',
      queryParameters: params,
    ))
        .data as Map<String, dynamic>;
    final response =
        PaginationResponse.fromMap(mappedResponse, (e) => Product.fromMap(e));

    return response;
  }
}
