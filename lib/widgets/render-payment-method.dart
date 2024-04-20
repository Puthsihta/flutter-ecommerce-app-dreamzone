import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/models/payment-method.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';

class RenderPaymentMethod extends StatelessWidget {
  final List<PaymentMethod> paymentMethod;
  final int index;
  final Function onTap;

  const RenderPaymentMethod(
      {super.key,
      required this.paymentMethod,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: marginVerticail / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  paymentMethod[index].image,
                  width: 45,
                  height: 45,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentMethod[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: titleColor,
                      ),
                    ),
                    Text(
                      paymentMethod[index].description,
                      style: TextStyle(
                        fontSize: 12,
                        color: descriptionColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.circle_outlined,
                color: inActiveColor,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
