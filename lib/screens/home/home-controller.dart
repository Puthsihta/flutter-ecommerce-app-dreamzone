import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/data/models/home.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:flutter/foundation.dart';

class HomeScreenController extends ChangeNotifier {
  final HomeRepo homeRepo;
  final HomeProvider? homeProvider;

  HomeScreenController({
    required this.homeRepo,
    this.homeProvider,
  });

  Home? _homeData;
  bool loading = true;
  Home? get homeData => _homeData;
  set homeData(Home? home) {
    _homeData = home;
    loading = false;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  Future<void> getHome() async {
    try {
      final data = await homeRepo.getHome();
      homeData = data;
      homeProvider?.homeData = data;
    } catch (e) {
      error = CustomException(e.toString());
      notifyListeners();
    } finally {
      loading = false;
    }
  }

  Future<void> getHomeData() async {
    loading = true;
    await getHome();
  }
}
