// ignore: file_names
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/providers/tab_provider.dart';
import 'package:dreamzone/screens/cart/my_cart_screen.dart';
import 'package:dreamzone/screens/order/my_order_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tabProvider = Provider.of<TabProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(l10n!.cart),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white, // Set your desired background color here
            child: TabBar(
              controller: tabProvider.tabController,
              indicatorColor: baseColor,
              unselectedLabelColor: descriptionColor,
              labelColor: baseColor,
              onTap: (index) {
                tabProvider.setIndex(index);
              },
              tabs: <Widget>[
                Tab(
                  child: Text(
                    l10n.my_cart,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    l10n.my_order,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabProvider.tabController,
              children: const <Widget>[MyCart(), MyOrders()],
            ),
          ),
        ],
      ),
    );
  }
}
