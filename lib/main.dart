import 'package:dreamzone/routes.dart';
import 'package:dreamzone/screens/auth/reset-pasword-screen.dart';
import 'package:dreamzone/screens/auth/signin-screen.dart';
import 'package:dreamzone/screens/auth/signup-screen.dart';
import 'package:dreamzone/screens/auth/verify-otp-screen.dart';
import 'package:dreamzone/screens/cart/order-detail-screen.dart';
import 'package:dreamzone/screens/cart/order-product-screen.dart';
import 'package:dreamzone/screens/cart/payment-sucess-screen.dart';
import 'package:dreamzone/screens/categories/categories-screen.dart';
import 'package:dreamzone/screens/notifications/notification-screen.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
import 'package:dreamzone/screens/products/product-favorite-screen.dart';
import 'package:dreamzone/screens/products/product-screen.dart';
import 'package:dreamzone/screens/products/special-product-screen.dart';
import 'package:dreamzone/screens/settings/about-us-screen.dart';
import 'package:dreamzone/screens/settings/change-password-screen.dart';
import 'package:dreamzone/screens/settings/contact-us-screen.dart';
import 'package:dreamzone/screens/settings/delete-account-screen.dart';
import 'package:dreamzone/screens/settings/edit-profile-screen.dart';
import 'package:dreamzone/screens/settings/privacy-policy-screen.dart';
import 'package:dreamzone/screens/settings/setting-screen.dart';
import 'package:dreamzone/screens/shop/all-shop-screen.dart';
import 'package:dreamzone/screens/shop/shop-detail-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DreamzoneApp());
}

class DreamzoneApp extends StatelessWidget {
  const DreamzoneApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DreamZone App',
      initialRoute: '/',
      routes: {
        '/': (context) => const TabNavigationBar(),
        '/auth/signin': (context) => const SignInScreen(),
        '/auth/signup': (context) => const SignUpScreen(),
        '/auth/verify-otp': (context) => const VerifyOtpScreen(),
        '/auth/reset-password': (context) => const ResetPasswordScreen(),
        '/cart/order': (context) => const OrderProductScreen(),
        '/order/detail': (context) => const OrderDetailScreen(),
        '/order/payment-success': (context) => const PaymentSuccesScreen(),
        '/categories': (context) => const CategorieScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/product/detail': (context) => const ProductDetailScreen(),
        '/product/favorite': (context) => const ProductFavoriteScreen(),
        '/product/all': (context) => const ProductScreen(),
        '/product/special': (context) => const SepecialProductScreen(),
        '/shop/all': (context) => const AllShopScreen(),
        '/shop/detail': (context) => const ShopDetailScreen(),
        '/profile/aboutus': (context) => const AboutUsScreen(),
        '/profile/privacy': (context) => const PrivacyPolicyScreen(),
        '/setting/change-password': (context) => const ChangePasswordScreen(),
        '/profile/contactus': (context) => const ContactUsScreen(),
        '/profile/delete-accouont': (context) => const DeleteAccountScreen(),
        '/profile/edit-profile': (context) => const EditProfileScreen(),
        '/profile/setting': (context) => const SettingScreen(),
      },
    );
  }
}
