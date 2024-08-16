// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/login.dart';
import 'package:flutter/material.dart';
import 'package:dreamzone/data/models/requests/login_request.dart';
import 'package:dreamzone/data/repos/login_repo.dart';

class SinginController extends ChangeNotifier {
  LoginRepo loginRepo;
  Function(String phone, Login? code)? onLoginSuccess;
  Function(dynamic message)? onLoginError;

  SinginController({
    required this.loginRepo,
    this.onLoginSuccess,
    this.onLoginError,
  });

  bool _loading = false;

  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Future<void> login({required String phone}) async {
    try {
      loading = true;
      final response = await loginRepo.login(
        LoginRequest(phone: "855$phone", is_debug: true),
      );
      if (response.data != null) {
        if (onLoginSuccess != null) {
          onLoginSuccess!("855$phone", response.data);
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
}
