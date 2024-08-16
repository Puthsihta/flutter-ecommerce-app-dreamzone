import 'package:dreamzone/constants/constants.dart';
import 'package:dreamzone/data/models/payment_method.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';

class RenderPaymentMethod extends StatelessWidget {
  final List<PaymentMethod> paymentMethod;
  final PaymentMethod? selectedPaymentMethod;
  final int index;
  final Function onTap;
  final bool disable;

  const RenderPaymentMethod({
    super.key,
    required this.paymentMethod,
    required this.index,
    required this.onTap,
    required this.disable,
    this.selectedPaymentMethod,
  });

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
                SizedBox(
                  width: 45,
                  height: 45,
                  child: TransparentImage(
                    url: paymentMethod[index].image_url!,
                    borderRadius: 45 / 2,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentMethod[index].name!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: titleColor,
                      ),
                    ),
                    Text(
                      paymentMethod[index].description!,
                      style: TextStyle(
                        fontSize: 12,
                        color: descriptionColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (!disable)
              IconButton(
                icon: Icon(
                  selectedPaymentMethod != null
                      ? selectedPaymentMethod!.id! == paymentMethod[index].id!
                          ? Icons.check_circle
                          : Icons.circle_outlined
                      : Icons.circle_outlined,
                  color: selectedPaymentMethod != null
                      ? selectedPaymentMethod!.id! == paymentMethod[index].id!
                          ? baseColor
                          : inActiveColor
                      : inActiveColor,
                ),
                onPressed: () {
                  onTap();
                },
              ),
          ],
        ),
      ),
    );
  }
}
