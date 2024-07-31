import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render-cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final carts = cartProvider.cart;
    return carts!.cart.isEmpty
        ? const NoItem()
        : ListView.builder(
            itemCount: carts.cart.length,
            itemBuilder: (context, index) {
              return renderCartItem(
                context,
                index,
                carts.cart,
              );
            },
          );
  }

  Widget renderCartItem(BuildContext context, int index, carts) {
    return RenderCartItem(
      cart: carts.values.elementAt(index),
      index: index,
    );
  }
}
