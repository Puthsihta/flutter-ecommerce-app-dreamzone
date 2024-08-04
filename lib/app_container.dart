import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/providers/theme_provider.dart';
import 'package:dreamzone/routes.dart';
import 'package:dreamzone/screens/address/address-form-screen.dart';
import 'package:dreamzone/screens/address/address-screen.dart';
import 'package:dreamzone/screens/address/update-location-screen.dart';
import 'package:dreamzone/screens/auth/reset-pasword-screen.dart';
import 'package:dreamzone/screens/auth/signin-screen.dart';
import 'package:dreamzone/screens/auth/signup-screen.dart';
import 'package:dreamzone/screens/auth/verify-otp-screen.dart';
import 'package:dreamzone/screens/cart/cart-detail-screen.dart';
import 'package:dreamzone/screens/cart/order-detail-screen.dart';
import 'package:dreamzone/screens/cart/order-product-screen.dart';
import 'package:dreamzone/screens/cart/payment-sucess-screen.dart';
import 'package:dreamzone/screens/categories/categories-screen.dart';
import 'package:dreamzone/screens/home/home-screen.dart';
import 'package:dreamzone/screens/notifications/notification-screen.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
import 'package:dreamzone/screens/products/product-favorite-screen.dart';
import 'package:dreamzone/screens/products/product-screen.dart';
import 'package:dreamzone/screens/shop/promotion-shop-screen.dart';
import 'package:dreamzone/screens/settings/about-us-screen.dart';
import 'package:dreamzone/screens/settings/change-password-screen.dart';
import 'package:dreamzone/screens/settings/contact-us-screen.dart';
import 'package:dreamzone/screens/settings/delete-account-screen.dart';
import 'package:dreamzone/screens/settings/edit-profile-screen.dart';
import 'package:dreamzone/screens/settings/privacy-policy-screen.dart';
import 'package:dreamzone/screens/settings/setting-screen.dart';
import 'package:dreamzone/screens/shop/all-shop-screen.dart';
import 'package:dreamzone/screens/shop/shop-detail-screen.dart';
import 'package:dreamzone/screens/splash-screen.dart';
import 'package:dreamzone/theme/dark_theme.dart';
import 'package:dreamzone/theme/light_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 480, name: MOBILE),
          const Breakpoint(start: 481, end: double.infinity, name: TABLET),
          // const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          // const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: context.watch<ThemeProvider>().themeMode,
      onGenerateRoute: (settings) {
        Route screen;

        final routes = {
          SplashView.routeName: const SplashView(),
          TabNavigationBar.routeName: const TabNavigationBar(
            index: 0,
          ),
          SignInScreen.routeName: const SignInScreen(),
          SignUpScreen.routeName: const SignUpScreen(),
          HomeScreen.routeName: const HomeScreen(),
          ResetPasswordScreen.routeName: const ResetPasswordScreen(),
          PaymentSuccesScreen.routeName: const PaymentSuccesScreen(),
          CategorieScreen.routeName: const CategorieScreen(),
          NotificationScreen.routeName: const NotificationScreen(),
          ProductFavoriteScreen.routeName: const ProductFavoriteScreen(),
          PromotionShopScreen.routeName: const PromotionShopScreen(),
          PrivacyPolicyScreen.routeName: const PrivacyPolicyScreen(),
          ChangePasswordScreen.routeName: const ChangePasswordScreen(),
          ContactUsScreen.routeName: const ContactUsScreen(),
          DeleteAccountScreen.routeName: const DeleteAccountScreen(),
          EditProfileScreen.routeName: const EditProfileScreen(),
          SettingScreen.routeName: const SettingScreen(),
          AboutUsScreen.routeName: const AboutUsScreen(),
          AddressScreen.routeName: const AddressScreen(),
        };

        switch (settings.name) {
          case VerifyOtpScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as VerfiyOtpArgument;
                return VerifyOtpScreen(argument: args);
              },
            );
            break;
          case UpdateLocationScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as UpdateLocationArgument;
                return UpdateLocationScreen(argument: args);
              },
            );
            break;
          case OrderProductScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as OrderProductArgument;
                return OrderProductScreen(argument: args);
              },
            );
            break;
          case AddressFromScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as AddressFromArgument;
                return AddressFromScreen(argument: args);
              },
            );
            break;
          case CartDetailScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as CartDetialArgument;
                return CartDetailScreen(argument: args);
              },
            );
            break;
          case OrderDetailScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as OrderDetailArgument;
                return OrderDetailScreen(argument: args);
              },
            );
            break;
          case ProductScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as ProductArgument;
                return ProductScreen(argument: args);
              },
            );
            break;
          case AllShopScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as AllShopArgument;
                return AllShopScreen(argument: args);
              },
            );
            break;
          case ProductDetailScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as ProductDetailArgument;
                return ProductDetailScreen(argument: args);
              },
            );
            break;
          case ShopDetailScreen.routeName:
            screen = MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as ShopDetailArgument;
                return ShopDetailScreen(argument: args);
              },
            );
            break;
          default:
            screen = MaterialPageRoute(
              settings: settings,
              builder: (_) {
                return routes[settings.name] ??
                    const Scaffold(
                      body: Center(
                        child: Text('Page Not Found'),
                      ),
                    );
              },
            );
            break;
        }
        return screen;
      },
    );
  }
}
