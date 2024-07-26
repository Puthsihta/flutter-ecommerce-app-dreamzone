import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/render-cart.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  final List<Product> carts = [
    Product(
        name: "MAGIC AMPOULE TONER PADS សំឡីជូតមុខ",
        id: 1,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
        discount: 10,
        prices: 36),
    Product(
        name: "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
        id: 2,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400972-1.webp",
        discount: 1,
        prices: 63),
    Product(
        name: "Peptide Ampoule Mist ទឹកបាញ់មុខ",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400758-1.webp",
        discount: 15,
        prices: 99),
    Product(
        name: "Peptide Eye Cream គ្រីមលាបត្របកភ្នែក",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400559-1.webp",
        discount: 3,
        prices: 99),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: carts.length,
            itemBuilder: (context, index) {
              return renderCartItem(context, index);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Subtotal"),
                  Text(currencyFormatter.format(136)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Discount"),
                  Text(currencyFormatter.format(10)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Amount"),
                  Text(
                    currencyFormatter.format(126),
                    style: TextStyle(
                      color: greenColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                text: "Checkout",
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/cart/order',
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget renderCartItem(BuildContext context, int index) {
    return RenderCartItem(cart: carts, index: index);
  }
}
