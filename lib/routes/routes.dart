import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/providers/route_provider.dart';
import 'package:dreamzone/screens/auth/signin/signin_screen.dart';
import 'package:dreamzone/screens/cart/cart_screen.dart';
import 'package:dreamzone/screens/home/home_screen.dart';
import 'package:dreamzone/screens/settings/profile_screen.dart';
import 'package:dreamzone/screens/shop/shop_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class TabNavigationBar extends StatefulWidget {
  static const routeName = "/route";
  final int index;
  const TabNavigationBar({super.key, required this.index});

  @override
  State<TabNavigationBar> createState() => _TabNavigationBarState();
}

class _TabNavigationBarState extends State<TabNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("Route Disposing");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeProvider = Provider.of<RouteProvider>(context, listen: true);
    final l10n = context.l10n;
    final cartProvider = context.watch<CartProvider>();
    final cart = cartProvider.cart;
    return Scaffold(
      body: IndexedStack(
        index: routeProvider.seleteIndex,
        children: const [
          HomeScreen(),
          ShopScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shop),
            label: l10n.shop,
          ),
          BottomNavigationBarItem(
            icon: cart!.cart.isEmpty
                ? const Icon(
                    Icons.shopping_cart,
                  )
                : Badge(
                    badgeContent: Text(
                      cart.cart.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
            label: l10n.cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: l10n.profile,
          ),
        ],
        currentIndex: routeProvider.seleteIndex,
        elevation: 1,
        backgroundColor: baseColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: secondColor,
        onTap: (index) {
          final authProvider = context.read<AuthProvider>();
          if (authProvider.isLoggedIn || index == 1 || index == 0) {
            routeProvider.setIndex(index);
          } else {
            Navigator.pushNamed(context, SignInScreen.routeName);
          }
        },
      ),
    );
  }
}
