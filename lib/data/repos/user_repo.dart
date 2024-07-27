import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/user.dart';
import 'package:dreamzone/locator.dart';

abstract class UserRepo {
  Future<User> getUser();
}

class UserRepoImpl implements UserRepo {
  final request = locator<Dio>();

  @override
  Future<User> getUser() async {
    final apiResponse =
        (await request.get('auth/profile')).data as Map<String, dynamic>;

    final response =
        BaseResponse.fromMap(apiResponse, User.fromMap(apiResponse["data"]));
    return response.data;
  }
}
