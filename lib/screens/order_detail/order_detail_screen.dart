import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/models/order-detail.dart';
import 'package:dreamzone/data/repos/order-_ist_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/order_detail/order_detail_controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/utils/validation.dart';
import 'package:dreamzone/widgets/custom_button.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                enableDrag: true,
                useSafeArea: true,
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          color: whiteSmoke,
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Select Options",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: titleColor,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.call,
                            color: iconColor,
                          ),
                          title: const Text('092389497'),
                          onTap: () {
                            // Handle delete action
                            // _takePhoto();
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.call,
                            color: iconColor,
                          ),
                          title: const Text('092389497'),
                          onTap: () {
                            // Handle edit action
                            // _getImageFromGallery();
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.support_agent),
          ),
        ],
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            OrderDetailController(orderListRepo: locator<OrderListRepo>())
              ..getOrderDetail(widget.argument.orderId),
        child: Consumer<OrderDetailController>(
            builder: (context, orderDetailController, child) {
          if (orderDetailController.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    if (orderDetailController.orderDetail!.status !=
                        OrderStatus.cancel)
                      OrderTacking(orderDetailController.orderDetail),
                    OrderInfo(orderDetailController.orderDetail),
                    OrderProduct(orderDetailController.orderDetail),
                    SizedBox(
                      height: 12 + MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
              if (orderDetailController.orderDetail!.status ==
                  OrderStatus.pending)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 25,
                      right: 25,
                      bottom: MediaQuery.of(context).padding.bottom,
                      // vertical: 20,
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: CustomButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: const Text("Cancel Order?"),
                              actions: [
                                CupertinoDialogAction(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      orderDetailController.onCancelOrder(
                                          widget.argument.orderId);
                                    },
                                    child: const Text(
                                      "Okie",
                                      style: TextStyle(color: Colors.blue),
                                    )),
                              ],
                              content: const Text(
                                  "Are you sure you wannt to cancel this order?"),
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Cancel Order",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container OrderTacking(OrderDetail? orderDetail) {
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
                isCheck: orderDetail!.status == OrderStatus.pending ||
                        orderDetail.status == OrderStatus.confirm ||
                        orderDetail.status == OrderStatus.delivery ||
                        orderDetail.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Pending",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck: orderDetail.status == OrderStatus.confirm ||
                        orderDetail.status == OrderStatus.delivery ||
                        orderDetail.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Confirm",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck: orderDetail.status == OrderStatus.delivery ||
                        orderDetail.status == OrderStatus.complete
                    ? true
                    : false,
                title: "Delivery",
              ),
              VerticalLine(),
              StatusTitle(
                isCheck:
                    orderDetail.status == OrderStatus.complete ? true : false,
                title: "Completed",
              ),
            ],
          ),
          Center(
            child: Lottie.asset(
              checkOrderStatusLottie(orderDetail.status!),
              width: orderDetail.status == OrderStatus.complete ||
                      orderDetail.status == OrderStatus.pending
                  ? 200
                  : orderDetail.status == OrderStatus.delivery
                      ? 165
                      : 140,
              height: orderDetail.status == OrderStatus.complete ||
                      orderDetail.status == OrderStatus.pending
                  ? 200
                  : orderDetail.status == OrderStatus.delivery
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
        thickness: 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container OrderProduct(OrderDetail? orderDetail) {
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
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "#${orderDetail!.invoice_no!}",
                style: TextStyle(
                  fontSize: 18,
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Divider(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: orderDetail.shop!.logo_image != null
                        ? TransparentImage(
                            url: orderDetail.shop!.logo_image!,
                          )
                        : Image.asset("assets/images/logo.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${orderDetail.shop!.name}",
                    style: TextStyle(
                      fontSize: 15,
                      color: titleColor,
                    ),
                  ),
                ],
              ),
              const Text("  |"),
              const Text("  |"),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    color: iconColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      orderDetail.address!.address!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                        color: titleColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orderDetail.product_data!.length,
            itemBuilder: (context, index) {
              return renderProduct(context, index, orderDetail.product_data);
            },
          ),
          const Divider(
            height: 20,
            indent: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currencyFormatter
                      .format(double.parse(orderDetail.sub_total!)),
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Packing Fee",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currencyFormatter.format(0),
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Fee",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "(Free Delivery)",
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      currencyFormatter.format(0),
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Discount",
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currencyFormatter
                      .format(double.parse(orderDetail.total_discount!)),
                  style: TextStyle(
                    color: discoutColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payble (incl. VAT)",
                  style: TextStyle(
                    color: discoutColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  currencyFormatter.format(double.parse(orderDetail.total!)),
                  style: TextStyle(
                    color: discoutColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProduct(
    BuildContext context,
    int index,
    List<ProductOrderDetail>? product,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          // ignore: unnecessary_null_comparison
          child: product![index].product!.image_url != null
              ? SizedBox(
                  width: 90,
                  height: 90,
                  child: TransparentImage(
                    url: product[index].product!.image_url,
                  ),
                )
              : Image.asset("assets/images/logo.png"),
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
                product[index].product!.name!,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (product[index].product!.discount != 0)
              Row(
                children: [
                  Text(
                    "Discount : ",
                    style: TextStyle(
                      fontSize: 12,
                      color: descriptionColor,
                    ),
                  ),
                  Text(
                    "${product[index].product!.discount.toString()}%",
                    style: TextStyle(
                      fontSize: 15,
                      color: discoutColor,
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (product[index].product!.discount != 0)
                        Text(
                          currencyFormatter.format(
                            double.parse(product[index].product!.price!),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: descriptionColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        currencyFormatter.format(double.parse(
                                product[index].product!.price!) -
                            ((product[index].product!.discount! / 100) *
                                double.parse(product[index].product!.price!))),
                        style: TextStyle(
                          fontSize: 15,
                          color: baseColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "x${product[index].quantity.toString()}",
                    style: TextStyle(
                      fontSize: 18,
                      color: titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Container OrderInfo(OrderDetail? orderDetail) {
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
                orderDetail!.user!.name!,
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
                "+${orderDetail.user!.phone!}",
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
                orderDetail.payment_method!.name!,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          if (orderDetail.remarks != "")
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
                  orderDetail.remarks!,
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
