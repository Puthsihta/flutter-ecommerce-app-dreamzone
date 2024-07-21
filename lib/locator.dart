import 'package:dio/dio.dart';
import 'package:dreamzone/client_request.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Dio>(ClientRequest().dio);
}
