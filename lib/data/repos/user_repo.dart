import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/requests/update-profile.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/user.dart';
import 'package:dreamzone/locator.dart';

abstract class UserRepo {
  Future<User> getUser();
  Future<bool> updateProfile(RequestUpdateProfile request);
}

class UserRepoImpl implements UserRepo {
  final client = locator<Dio>();

  @override
  Future<User> getUser() async {
    final apiResponse = (await client.get(
      'auth/profile',
    ))
        .data as Map<String, dynamic>;

    final response =
        BaseResponse.fromMap(apiResponse, User.fromMap(apiResponse["data"]));
    return response.data;
  }

  @override
  Future<bool> updateProfile(RequestUpdateProfile request) async {
    final apiResponse =
        (await client.put('auth/update-user', data: request.toMap())).data
            as Map<String, dynamic>;
    return apiResponse["message"];
  }
}
