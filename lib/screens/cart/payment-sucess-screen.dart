import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccesScreen extends StatelessWidget {
  const PaymentSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset(
              'assets/jsons/success.json',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
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
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: CustomButton(
                text: "Confirm",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
