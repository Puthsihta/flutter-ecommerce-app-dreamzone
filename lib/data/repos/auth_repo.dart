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
  Future<BaseResponse<Token?>> login(LoginRequest request);
  Future<void> logout();
  Future<BaseResponse<Token?>> refreshToken(String refreshToken);
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
  Future<BaseResponse<Token?>> login(LoginRequest request) async {
    final mappedResponse = (await client.post(
      "/api/login",
      data: request.toMap(),
      // queryParameters: {"test": true},
    ))
        .data as Map<String, dynamic>;

    print("mappedReponse : $mappedResponse ");
    final prefs = await _preferences;
    final response = BaseResponse.fromMap(
        mappedResponse,
        mappedResponse["data"] == null
            ? null
            : Token.fromMap(mappedResponse["data"]));

    print("getRefresh token in login : ${response.data}");

    if (response.data != null) {
      final tokenString = response.data!.toJson();

      if (tokenString != '') {
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
  }

  @override
  Future<BaseResponse<Token?>> refreshToken(String refreshToken) async {
    final mappedResponse = (await client
            .post('/api/refresh-token', data: {"refresh_token": refreshToken}))
        .data as Map<String, dynamic>;

    final prefs = await _preferences;
    final response = BaseResponse.fromMap(
        mappedResponse,
        mappedResponse["data"] == null
            ? null
            : Token.fromMap(mappedResponse["data"]));

    // print('response refresh Token : ${response.data}');

    if (response.data != null) {
      final tokenString = response.data!.toJson();

      if (tokenString != '') {
        prefs.setString(StorageKeys.TOKEN_KEY, tokenString);
      }
    }

    return response;
  }
}
