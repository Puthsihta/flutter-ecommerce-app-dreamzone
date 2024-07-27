// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/user.dart';
import 'package:dreamzone/data/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  final UserRepo userRepo;

  UserProvider({
    required this.userRepo,
  });

  final _preferences = SharedPreferences.getInstance();

  User? _user;

  User? get user => _user;
  set user(User? newUser) {
    _user = newUser;
    notifyListeners();
    _preferences.then((pref) {
      if (newUser != null) {
        pref.setString(StorageKeys.USER_KEY, newUser.toJson());
      } else {
        pref.remove(StorageKeys.USER_KEY);
      }
    });
  }

  Future<void> getUser() async {
    await Future.delayed(const Duration(milliseconds: 300));
    user = await userRepo.getUser();
  }

  Future<void> ensureInitialization() async {
    try {
      final prefs = await _preferences;
      final userPref = prefs.getString(StorageKeys.USER_KEY);

      if (userPref != null) {
        user = User.fromJson(userPref);
      } else {
        throw "user undefined";
      }
    } catch (e) {
      user = null;
    }
  }
}
