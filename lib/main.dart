import 'package:dreamzone/app_container.dart';
import 'package:dreamzone/constants/locales.dart';
import 'package:dreamzone/data/repos/auth_repo.dart';
import 'package:dreamzone/data/repos/home_repo.dart';
import 'package:dreamzone/data/repos/user_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:dreamzone/providers/shop_provider.dart';
import 'package:dreamzone/providers/theme_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: ".env");

  setupLocator();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: Locales.en,
      supportedLocales: const [Locales.en, Locales.km],
      child: const DreamzoneApp(),
    ),
  );
}

class DreamzoneApp extends StatefulWidget {
  const DreamzoneApp({super.key});

  @override
  State<DreamzoneApp> createState() => _DreamzoneAppState();
}

class _DreamzoneAppState extends State<DreamzoneApp> {
  @override
  void initState() {
    double width = (PlatformDispatcher.instance.views.first.physicalSize.width /
        PlatformDispatcher.instance.views.first.devicePixelRatio);

    if (width >= 481) {
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    double width = (PlatformDispatcher.instance.views.first.physicalSize.width /
        PlatformDispatcher.instance.views.first.devicePixelRatio);
    if (width >= 481) {
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
    }

    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
      },
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(
              onTokenChanged: (token) {
                // print("on token changed : ${token}");
              },
              authRepo: locator<AuthRepo>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => ShopProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeProvider(homeRepo: locator<HomeRepo>()),
          ),
          ChangeNotifierProvider(
            create: (_) => UserProvider(
              userRepo: locator<UserRepo>(),
            ),
          ),
        ],
        child: const AppContainer(),
      ),
    );
  }
}
