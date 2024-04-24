import 'package:dreamzone/models/home.model.dart';
import 'package:dreamzone/services/home.service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeService homeService = HomeService();
  bool isLoading = false;
  List<Slides> slides = [];
  List<Product> product = [];
  List<Shop> shop = [];
  List<BestSeller> bestSeller = [];

  Future<void> getHome() async {
    isLoading = true;
    notifyListeners();

    final respone = await homeService.getHome();
    // home = respone;
    slides = respone.data!.slides!.toList();
    product = respone.data!.product!.toList();
    shop = respone.data!.shop!.toList();
    bestSeller = respone.data!.bestSeller!.toList();

    isLoading = false;
    notifyListeners();
  }
}
