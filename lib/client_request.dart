import 'package:dio/dio.dart';
import 'package:dreamzone/constants/app_env.dart';
import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/token.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomInterceptor extends Interceptor {
  final Function()? onRefreshTokenExpired;

  CustomInterceptor({this.onRefreshTokenExpired});
  final preference = SharedPreferences.getInstance();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ClientRequest().getToken();
    // print("onRequest in Custom : ${options.data}");
    if (token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // print('onresponse in customInterceptor : ${response.data}');

    if (response.data["status"] >= 400) {
      if (response.data["status"] == 401) {
        if (!response.requestOptions.path.contains('/api/login') &&
            !response.requestOptions.path.contains('/api/refresh-token')) {
          try {
            final newToken = await ClientRequest().refreshToken();

            try {
              final retryRequest =
                  await ClientRequest()._retry(response.requestOptions);

              if (newToken.isNotEmpty) {
                response.requestOptions.headers['Authorization'] =
                    "Bearer $newToken";
              }

              if (retryRequest.data["status"] == 401) {
                onRefreshTokenExpired!();
                final pref = await preference;
                pref.clear();
              }
              return handler.resolve(retryRequest);
            } catch (e) {
              // print("erorr _retry : $e");
            }
          } catch (e) {
            if (onRefreshTokenExpired != null) {
              onRefreshTokenExpired!();
              final pref = await preference;
              pref.clear();
              // print("logout");
            }
          }
        } else {
          return handler.reject(DioException(
              type: DioExceptionType.badResponse,
              requestOptions: response.requestOptions,
              response: response,
              error: response,
              message: response.data['message']));
        }
      }
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("error response in CustomInterceptor : $err");

    super.onError(err, handler);
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

  Future<String> getRefreshToken() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final tokenResponse = storage.getString(StorageKeys.TOKEN_KEY);
    if (tokenResponse != null) {
      // print("getRefreshToken : ${Token.fromJson(tokenResponse).refresh_token}");
      return Token.fromJson(tokenResponse).refresh_token;
    }
    return "";
  }

  Future<String> refreshToken() async {
    AuthRepo authRepo = AuthRepoImpl();

    final refreshToken = await getRefreshToken(); //get old refreshToken
    if (refreshToken.isEmpty) {
      throw "";
    }
    final response = await authRepo.refreshToken(refreshToken);

    if (response.status == 401) {
      return response.message;
    }

    return response.data!.token;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
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
