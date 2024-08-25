import 'package:dreamzone/data/models/order.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/material.dart';

class RenderOrderItem extends StatelessWidget {
  final List<OrderList> order;
  final int index;
  final Function onTap;

  const RenderOrderItem(
      {super.key,
      required this.order,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        // height: 130,
        margin: EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n!.order_id,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  order[index].invoice_no!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  l10n.date,
                  style: TextStyle(
                    fontSize: 15,
                    color: descriptionColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(" : "),
                Text(
                  order[index].created_at!,
                  style: TextStyle(
                    fontSize: 15,
                    color: titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  Text(
                    l10n.total,
                    style: TextStyle(
                      fontSize: 15,
                      color: descriptionColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(" : "),
                  Text(
                    currencyFormatter.format(double.parse(order[index].total!)),
                    style: TextStyle(
                      fontSize: 15,
                      color: secondColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      l10n.total_items,
                      style: TextStyle(
                        fontSize: 15,
                        color: descriptionColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(" : "),
                    Text(
                      order[index].total_item.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: titleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  checkOrderStatus(order[index].status!, l10n),
                  style: TextStyle(
                    color: statusColor(order[index].status!),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
