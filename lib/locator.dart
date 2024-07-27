import 'package:dio/dio.dart';
import 'package:dreamzone/client_request.dart';
import 'package:dreamzone/data/repos/all_shop_repo.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:dreamzone/data/repos/categories_repo.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:dreamzone/data/repos/login_repo.dart';
import 'package:dreamzone/data/repos/product_detail_repo.dart';
import 'package:dreamzone/data/repos/product_repo.dart';
import 'package:dreamzone/data/repos/shop_detail_repo.dart';
import 'package:dreamzone/data/repos/shop_repo.dart';
import 'package:dreamzone/data/repos/user_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Dio>(ClientRequest().dio);
  locator.registerLazySingleton<HomeRepo>(() => HomeRepoImpl());
  locator.registerLazySingleton<ShopRepo>(() => ShopRepoImpl());
  locator.registerLazySingleton<CategoriesRespo>(() => CategoriesRespoImpl());
  locator.registerLazySingleton<ProductRepo>(() => ProductRepoImpl());
  locator.registerLazySingleton<AllShopRepo>(() => AllShopRepoImpl());
  locator
      .registerLazySingleton<ProductDetialRepo>(() => ProductDetialRepoImpl());
  locator.registerLazySingleton<ShopDetailRepo>(() => ShopDetailRepoImpl());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  locator.registerLazySingleton<LoginRepo>(() => LoginRepoImpl());
  locator.registerLazySingleton<UserRepo>(() => UserRepoImpl());
}
