import 'package:dio/dio.dart';
import 'package:dreamzone/constants/app_env.dart';
import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/token.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptor extends Interceptor {
  final preference = SharedPreferences.getInstance();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ClientRequest().getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }
    super.onRequest(options, handler);
  }
}

class ClientRequest {
  Dio dio = Dio();

  Future<String> getToken() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final tokenResponse = storage.getString(StorageKeys.TOKEN_KEY);

    if (tokenResponse != null) {
      return Token.fromJson(tokenResponse).token;
    }
    return "";
  }

  ClientRequest() {
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    dio.options.baseUrl = AppEnv.baseUrl;
    dio.interceptors.add(CustomInterceptor());
  }
}
