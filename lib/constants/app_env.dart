import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class AppEnv {
  static final String env = dotenv.get("ENV");
  static final String baseUrl = dotenv.get("BASE_URL");
}
