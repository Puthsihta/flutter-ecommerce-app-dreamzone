import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/requests/login_request.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:flutter/material.dart';

class VerifyOtpController extends ChangeNotifier {
  final AuthRepo authRepo;
  late AuthProvider authProvider;
  late UserProvider userProvider;
  Function()? onLoginSuccess;
  Function(dynamic message)? onLoginError;

  VerifyOtpController({
    required this.authProvider,
    required this.authRepo,
    this.onLoginError,
    this.onLoginSuccess,
    required this.userProvider,
  });

  bool _loading = false;

  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Future<void> verifyOtp({required String phone, required String otp}) async {
    try {
      loading = true;
      final response =
          await authRepo.verifyOtp(VerifyOtpRequest(phone: phone, otp: otp));

      if (response.data != null) {
        authProvider.token = response.data!.token;
        userProvider.user = response.data!.user;

        if (onLoginSuccess != null) {
          onLoginSuccess!();
        }
      } else {
        if (onLoginError != null) {
          onLoginError!(response.data);
        }
      }
    } catch (e) {
      var message = e.toString();
      if (e is DioException) {
        if (e.message != null) {
          message = e.message!;
        }
      }
      print('message : $message, ');
      onLoginError!(message);
    } finally {
      loading = false;
    }
  }

  Future<void> logout() async {
    await authRepo.logout();
  }
}
