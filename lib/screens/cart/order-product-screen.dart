import 'package:dreamzone/models/payment-method.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/render-payment-method.dart';
import 'package:flutter/material.dart';

class OrderProductScreen extends StatefulWidget {
  static const routeName = "/cart/order";
  const OrderProductScreen({super.key});

  @override
  State<OrderProductScreen> createState() => _OrderProductScreenState();
}

class _OrderProductScreenState extends State<OrderProductScreen> {
  final List<PaymentMethod> paymentMethod = [
    PaymentMethod(
      id: 1,
      image: 'assets/images/khqr.png',
      name: 'ABA KHQR',
      description: 'Scan to pay with any banking app',
    ),
    PaymentMethod(
      id: 1,
      image: 'assets/images/order/point.png',
      name: 'Use Point',
      description: 'Pay by point in your wallet',
    ),
    PaymentMethod(
      id: 1,
      image: 'assets/images/order/cash.png',
      name: 'Cash',
      description: 'Pay with delivery',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Payment"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: placeHolderColor,
                        style: TextStyle(color: titleColor, fontSize: 15),
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: 'Enter your name',
                          labelStyle: const TextStyle(
                            color: Colors.grey, // Color when not focused
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: placeHolderColor,
                            size: 25,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        cursorColor: placeHolderColor,
                        style: TextStyle(color: titleColor, fontSize: 15),
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: 'Enter your phone number',
                          labelStyle: const TextStyle(
                            color: Colors.grey, // Color when not focused
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: placeHolderColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order Adresse",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        cursorColor: placeHolderColor,
                        style: TextStyle(color: titleColor, fontSize: 15),
                        decoration: InputDecoration(
                          labelText: "Adresse",
                          hintText: 'Enter your address',
                          labelStyle: const TextStyle(
                            color: Colors.grey, // Color when not focused
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.pin_drop,
                            color: placeHolderColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order Remark",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        maxLines: null,
                        cursorColor: placeHolderColor,
                        style: TextStyle(color: titleColor, fontSize: 15),
                        decoration: InputDecoration(
                          labelText: "Remark",
                          hintText: 'Noted something here ...',
                          labelStyle: const TextStyle(
                            color: Colors.grey, // Color when not focused
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.lightBlue,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.edit,
                            color: placeHolderColor,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Payment Methods",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: paymentMethod.length,
                        itemBuilder: (context, index) {
                          return renderPaymentMethod(context, index);
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Order Summary",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
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
                              Container(
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
                                    currencyFormatter.format(5),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: greenColor,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 230,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          currencyFormatter.format(44),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: descriptionColor,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          currencyFormatter.format(39),
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: secondColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "x1",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: titleColor,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                            currencyFormatter.format(5),
                            style: TextStyle(
                              color: descriptionColor,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buttonOrder(),
        ],
      ),
    );
  }

  Container buttonOrder() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
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
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
            text: "Confirm",
            onPressed: () {
              Navigator.pushNamed(context, '/order/payment-success');
            },
          ),
        ],
      ),
    );
  }

  Widget renderPaymentMethod(BuildContext context, int index) {
    return RenderPaymentMethod(
      paymentMethod: paymentMethod,
      index: index,
      onTap: () {},
      disable: false,
    );
  }
}
