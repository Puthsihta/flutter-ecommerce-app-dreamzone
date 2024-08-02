import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccesScreen extends StatelessWidget {
  static const routeName = "/order/payment-success";
  const PaymentSuccesScreen({super.key});

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
                    Navigator.pop(context);
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
