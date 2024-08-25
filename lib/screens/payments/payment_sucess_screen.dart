import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/screens/order_detail/order_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccesScreen extends StatefulWidget {
  static const routeName = "/order/payment-success";
  final OrderSuccessArgument argument;
  const PaymentSuccesScreen({super.key, required this.argument});

  @override
  State<PaymentSuccesScreen> createState() => _PaymentSuccesScreenState();
}

class _PaymentSuccesScreenState extends State<PaymentSuccesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/jsons/success.json',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Your has order successfully!",
                    style: TextStyle(
                      color: descriptionColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: CustomButton(
                  onPressed: () {
                    final int orderId = widget.argument.orderId;
                    Navigator.of(context).pushNamed(
                      OrderDetailScreen.routeName,
                      arguments: OrderDetailArgument(orderId),
                    );
                  },
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
