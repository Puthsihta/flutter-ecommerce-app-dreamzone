import 'package:dreamzone/providers/theme_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  static const routeName = "/";
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    final themeProvider = context.read<ThemeProvider>();
    // final authProvider = context.read<AuthProvider>();
    // final shopProvider = context.read<ShopProvider>();
    // final userProvider = context.read<UserProvider>();

    await themeProvider.ensureInitialization();
    // await authProvider.ensureInitialization();
    // await shopProvider.ensureInitialization();
    // await userProvider.ensureInitialization();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        Navigator.of(context).pushReplacementNamed(TabNavigationBar.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
