import 'package:dreamzone/screens/cart/my-cart-screen.dart';
import 'package:dreamzone/screens/cart/my-order-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text('Carts'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white, // Set your desired background color here
            child: TabBar(
              controller: tabController,
              indicatorColor: baseColor,
              unselectedLabelColor: descriptionColor,
              labelColor: baseColor,
              tabs: const <Widget>[
                Tab(
                  child: Text(
                    "My Carts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "My Orders",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const <Widget>[MyCart(), MyOrders()],
            ),
          ),
        ],
      ),
    );
  }
}
