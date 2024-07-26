import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/home.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/locator.dart';

abstract class HomeRepo {
  Future<Home> getHome();
  Future<HomePrefeed> getProductPrefeeds();
}

class HomeRepoImpl implements HomeRepo {
  final request = locator<Dio>();

  @override
  Future<Home> getHome() async {
    final apiResponse =
        (await request.get('home')).data as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      Home.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }

  @override
  Future<HomePrefeed> getProductPrefeeds() async {
    final apiResponse =
        (await request.get('home/home-prefeeds')).data as Map<String, dynamic>;
    final response = BaseResponse.fromMap(
      apiResponse,
      HomePrefeed.fromMap(
        apiResponse["data"],
      ),
    );
    return response.data;
  }
}
