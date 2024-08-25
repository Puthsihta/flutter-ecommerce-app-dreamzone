import 'package:dreamzone/providers/address_provider.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/providers/language_provider.dart';
import 'package:dreamzone/providers/theme_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/routes/routes.dart';
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
    final authProvider = context.read<AuthProvider>();
    final userProvider = context.read<UserProvider>();
    final cartProvider = context.read<CartProvider>();
    final addressProvider = context.read<AddressProvider>();
    final langProvider = context.read<LocaleProvider>();

    await themeProvider.ensureInitialization();
    await authProvider.ensureInitialization();
    await userProvider.ensureInitialization();
    // await cartProvider.clearCart();
    await cartProvider.ensureInitialization();
    await addressProvider.ensureInitialization();
    await langProvider.ensureInitialization();

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
