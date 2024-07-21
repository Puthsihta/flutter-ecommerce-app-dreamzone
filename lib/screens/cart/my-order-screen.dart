// ignore: file_names
import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/models/order.model.dart';
import 'package:dreamzone/screens/cart/order-detail-screen.dart';
import 'package:dreamzone/widgets/render-order-item.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final List<Order> orders = [
    Order(
        id: 1,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: OrderStatus.pending,
        orderDate: "2024-03-18 21:49:17"),
    Order(
        id: 1,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: OrderStatus.confirm,
        orderDate: "2024-03-18 21:49:17"),
    Order(
        id: 1,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: OrderStatus.delivery,
        orderDate: "2024-03-18 21:49:17"),
    Order(
        id: 1,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: OrderStatus.complete,
        orderDate: "2024-03-18 21:49:17"),
    Order(
        id: 2,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: OrderStatus.cancel,
        orderDate: "2024-03-18 21:49:17"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return renderOrderItem(context, index);
        });
  }

  Widget renderOrderItem(BuildContext context, int index) {
    return RenderOrderItem(
      order: orders,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          OrderDetailScreen.routeName,
          arguments: OrderDetailArgument(order: orders[index]),
        );
      },
    );
  }
}
