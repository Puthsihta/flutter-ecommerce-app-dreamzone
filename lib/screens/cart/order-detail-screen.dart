import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/models/order.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderDetailScreen extends StatefulWidget {
  static const routeName = "/order/detail";

  final OrderDetailArgument argument;
  const OrderDetailScreen({super.key, required this.argument});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteSmoke,
        appBar: AppBar(
          backgroundColor: baseColor,
          title: const Text("Order Detail"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  if (widget.argument.order.status != OrderStatus.cancel)
                    OrderTacking(widget.argument.order),
                  OrderInfo(),
                  OrderProduct(),
                ],
              ),
            ),
            if (widget.argument.order.status == OrderStatus.pending)
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 20,
                ),
                child: CustomButton(
                  text: "Cancel Order",
                  onPressed: () {},
                ),
              ),
          ],
        ));
  }

  // ignore: non_constant_identifier_names
  Container OrderTacking(Order? propData) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTitle(
                isCheck: widget.argument.order.status == OrderStatus.pending ||
                        widget.argument.order.status == OrderStatus.confirm ||
                        widget.argument.order.status == OrderStatus.delivery ||
                        widget.argument.order.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Pending",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck: widget.argument.order.status == OrderStatus.confirm ||
                        widget.argument.order.status == OrderStatus.delivery ||
                        widget.argument.order.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Confirm",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck: widget.argument.order.status == OrderStatus.delivery ||
                        widget.argument.order.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Delivery",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck: widget.argument.order.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Completed",
              ),
            ],
          ),
          Center(
            child: Lottie.asset(
              checkOrderStatusLottie(widget.argument.order.status),
              width: widget.argument.order.status == OrderStatus.complete ||
                      widget.argument.order.status == OrderStatus.pending
                  ? 200
                  : widget.argument.order.status == OrderStatus.delivery
                      ? 165
                      : 140,
              height: widget.argument.order.status == OrderStatus.complete ||
                      widget.argument.order.status == OrderStatus.pending
                  ? 200
                  : widget.argument.order.status == OrderStatus.delivery
                      ? 165
                      : 140,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container VerticalLine() {
    return Container(
      height: 30,
      // color: Colors.red,
      margin: const EdgeInsets.only(left: 5),
      child: const VerticalDivider(
        thickness: 2,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container OrderProduct() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order ID",
                style: TextStyle(
                  fontSize: 18,
                  color: titleColor,
                ),
              ),
              Text(
                "N-923032",
                style: TextStyle(
                  fontSize: 18,
                  color: titleColor,
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 15,
                        color: titleColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 230,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currencyFormatter.format(39),
                          style: TextStyle(
                            fontSize: 15,
                            color: secondColor,
                          ),
                        ),
                        Text(
                          "x1",
                          style: TextStyle(
                              fontSize: 18,
                              color: titleColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(
            height: 20,
            indent: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Total",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                currencyFormatter.format(39),
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                currencyFormatter.format(0),
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                currencyFormatter.format(39),
                style: TextStyle(
                    color: secondColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container OrderInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: titleColor,
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "Puthsitha",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Contact Phone",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "+85592389497",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Adress",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "PhnomPenh",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Payment Type",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "ABA",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Remark",
                style: TextStyle(
                  color: descriptionColor,
                  fontSize: 15,
                ),
              ),
              Text(
                "Testing",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StatusTitle extends StatelessWidget {
  final String title;
  final bool isCheck;
  const StatusTitle({
    super.key,
    required this.title,
    required this.isCheck,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          color: isCheck ? secondColor : descriptionColor,
          isCheck ? Icons.check_circle : Icons.check_circle_outline,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isCheck ? secondColor : descriptionColor,
              ),
        ),
      ],
    );
  }
}
