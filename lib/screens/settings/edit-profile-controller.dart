// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/requests/update-profile.dart';
import 'package:dreamzone/data/repos/user_repo.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:flutter/material.dart';

class EditProfileController extends ChangeNotifier {
  UserRepo userRepo;
  Function()? onEditProfileSuccess;
  Function(dynamic message)? onEditProfileError;
  late UserProvider userProvider;

  EditProfileController({
    required this.userRepo,
    this.onEditProfileSuccess,
    this.onEditProfileError,
    required this.userProvider,
  });

  bool _loading = false;

  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Future<void> updateProfile(RequestUpdateProfile data) async {
    try {
      loading = true;
      final response = await userRepo.updateProfile(data);
      if (response) {
        if (onEditProfileSuccess != null) {
          userProvider.getUser();
          onEditProfileSuccess!();
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
      onEditProfileError!(message);
    } finally {
      loading = false;
    }
  }
}
