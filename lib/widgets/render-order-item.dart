import 'package:dreamzone/models/order.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class RenderOrderItem extends StatelessWidget {
  final List<Order> order;
  final int index;

  const RenderOrderItem({super.key, required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                order[index].invoiceNumber,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                "Date: ",
                style: TextStyle(fontSize: 15, color: descriptionColor),
              ),
              Text(
                order[index].orderDate,
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Total: ",
                style: TextStyle(fontSize: 15, color: descriptionColor),
              ),
              Text(
                order[index].totalPrice.toString(),
                style: TextStyle(fontSize: 15, color: titleColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Total Item: ",
                    style: TextStyle(fontSize: 15, color: descriptionColor),
                  ),
                  Text(
                    order[index].totalItem.toString(),
                    style: TextStyle(fontSize: 15, color: titleColor),
                  ),
                ],
              ),
              Text(
                order[index].status,
                style: TextStyle(color: voidTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
