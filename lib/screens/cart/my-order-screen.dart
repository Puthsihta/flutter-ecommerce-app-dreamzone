import 'package:dreamzone/models/order.model.dart';
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
        status: "Cancel",
        orderDate: "2024-03-18 21:49:17"),
    Order(
        id: 2,
        invoiceNumber: "Nº-0055",
        totalItem: 3,
        totalPrice: 120,
        status: "Cancel",
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
    return RenderOrderItem(order: orders, index: index);
  }
}
