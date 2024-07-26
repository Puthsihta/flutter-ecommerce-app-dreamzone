import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/category.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/locator.dart';

abstract class CategoriesRespo {
  Future<Categories> getSubCategories(int cateId);
}

class CategoriesRespoImpl implements CategoriesRespo {
  final request = locator<Dio>();

  @override
  Future<Categories> getSubCategories(int cateId) async {
    final apiResponse =
        (await request.get('category/sub-category?cate_id=$cateId')).data
            as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      Categories.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }
}
