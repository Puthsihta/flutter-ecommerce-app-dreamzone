import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/requests/login_request.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/token.dart';
import 'package:dreamzone/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepo {
  Future<Token?> getToken();
  Future<BaseResponse<Token?>> verifyOtp(VerifyOtpRequest request);
  Future<void> logout();
}

class AuthRepoImpl implements AuthRepo {
  final _preferences = SharedPreferences.getInstance();
  final client = locator<Dio>();

  @override
  Future<Token?> getToken() async {
    try {
      final prefs = await _preferences;
      final tokenString = prefs.getString(StorageKeys.TOKEN_KEY);
      if (tokenString == null) {
        return null;
      }

      return Token.fromJson(json.decode(tokenString));
    } catch (e) {
      print("error get token :$e");
      return null;
    }
  }

  @override
  Future<BaseResponse<Token?>> verifyOtp(VerifyOtpRequest request) async {
    final mappedResponse =
        (await client.post("auth/verify-sms", data: request.toMap())).data
            as Map<String, dynamic>;
    final prefs = await _preferences;
    final response = BaseResponse.fromMap(
      mappedResponse,
      mappedResponse["data"] == null
          ? null
          : Token.fromMap(
              mappedResponse["data"],
            ),
    );

    // print("getRefresh token in login : ${response.data}");

    if (response.data != null) {
      final tokenString = response.data!.toJson();

      if (tokenString != '') {
        // print("tokenString : $tokenString");
        prefs.setString(StorageKeys.TOKEN_KEY, tokenString);
        // print("login refresh token : ${response.data!.refresh_token}");
      }
    }

    return response;
  }

  @override
  Future<void> logout() async {
    final prefs = await _preferences;
    prefs.remove(StorageKeys.TOKEN_KEY);
    prefs.remove(StorageKeys.CART_KEY);
  }
}
