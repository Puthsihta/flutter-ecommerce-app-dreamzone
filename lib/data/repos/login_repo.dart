import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/login.dart';
import 'package:dreamzone/data/models/requests/login_request.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/locator.dart';

abstract class LoginRepo {
  Future<BaseResponse<Login?>> login(LoginRequest request);
}

class LoginRepoImpl implements LoginRepo {
  // final _preferences = SharedPreferences.getInstance();
  final client = locator<Dio>();

  @override
  Future<BaseResponse<Login?>> login(LoginRequest request) async {
    final mappedResponse = (await client.post(
      "auth/send-sms",
      data: request.toMap(),
    ))
        .data as Map<String, dynamic>;

    // final prefs = await _preferences;
    final response = BaseResponse.fromMap(
      mappedResponse,
      mappedResponse["data"] == null
          ? null
          : Login.fromMap(
              mappedResponse["data"],
            ),
    );

    return response;
  }
}
