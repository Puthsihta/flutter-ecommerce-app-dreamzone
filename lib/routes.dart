import 'package:dreamzone/providers/auth_provider.dart';
import 'package:dreamzone/screens/auth/signin-screen.dart';
import 'package:dreamzone/screens/cart/cart-screen.dart';
import 'package:dreamzone/screens/home/home-screen.dart';
import 'package:dreamzone/screens/settings/profile-screen.dart';
import 'package:dreamzone/screens/shop/shop-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabNavigationBar extends StatefulWidget {
  static const routeName = "/route";
  final int index;
  const TabNavigationBar({super.key, required this.index});

  @override
  State<TabNavigationBar> createState() => _TabNavigationBarState();
}

class _TabNavigationBarState extends State<TabNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    if (kDebugMode) {
      print("IN here initState");
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print("IN here dispose");
    }
  }

  void _onItemTapped(int index) {
    final authProvider = context.read<AuthProvider>();
    setState(
      () {
        if (authProvider.isLoggedIn || index == 1 || index == 0) {
          _selectedIndex = index;
        } else {
          // Navigate to login screen if not logged in
          Navigator.pushNamed(context, SignInScreen.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        elevation: 1,
        backgroundColor: baseColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: secondColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
