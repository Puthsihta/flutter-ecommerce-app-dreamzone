import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/token.dart';
import 'package:dreamzone/data/models/user.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;
  final Function(String)? onTokenChanged;
  AuthProvider({required this.authRepo, this.onTokenChanged});

  String? _token;
  User? _user;

  bool get isLoggedIn => _token != null;

  String? get token => _token;
  set token(String? newToken) {
    _token = newToken;
    notifyListeners();
    if (onTokenChanged != null) {
      onTokenChanged!(newToken ?? "");
    }
  }

  User? get user => _user;
  set user(User? newUser) {
    _user = newUser;
    notifyListeners();
  }

  Future<void> logout() async {
    await authRepo.logout();
  }

  Future<void> ensureInitialization() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      final tokenString = _prefs.getString(StorageKeys.TOKEN_KEY);
      if (tokenString != null) {
        final tokenResponse = Token.fromJson(tokenString);
        token = tokenResponse.token;
      }
    } catch (e) {}
  }
}
