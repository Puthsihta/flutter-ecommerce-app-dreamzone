import 'package:dreamzone/data/models/home.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepo homeRepo;

  HomeProvider({
    required this.homeRepo,
  });

  Home? _home;
  Home? get homeData => _home;
  set homeData(Home? data) {
    _home = data;
    notifyListeners();
  }
}
