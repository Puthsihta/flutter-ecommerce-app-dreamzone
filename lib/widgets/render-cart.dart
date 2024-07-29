import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/theme/theme.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RenderCartItem extends StatelessWidget {
  final List<Product> cart;
  final int index;

  const RenderCartItem({super.key, required this.cart, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, index == 0 ? 15 : 0, 15, 15),
      padding: const EdgeInsets.all(10),
      // height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: whiteSmoke,
                      backgroundImage:
                          const AssetImage('assets/images/logo.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Cafe Amazon",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: titleColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoAlertDialog(
                        title: const Text("Delete Cart?"),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          CupertinoDialogAction(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.blue),
                              )),
                        ],
                        content: const Text("You can add more cart!"),
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete_outline, color: secondColor),
              )
            ],
          ),
          for (int item in [1, 2, 3])
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        cart[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          cart[index].name,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Discout : ",
                            style: TextStyle(
                                fontSize: 12, color: descriptionColor),
                          ),
                          Text(
                            // products[index].discount.toString(),
                            currencyFormatter.format(cart[index].discount),
                            style: TextStyle(
                              fontSize: 13,
                              color: greenColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            currencyFormatter.format(cart[index].prices),
                            style: TextStyle(
                              fontSize: 15,
                              color: placeHolderColor,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            currencyFormatter.format(
                                cart[index].prices - cart[index].discount),
                            style: TextStyle(
                              fontSize: 15,
                              color: baseColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: descriptionColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    width: 50,
                                    child: Center(
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle_outline,
                                        color: descriptionColor),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart/order');
              },
              child: const Text("Checkout 34.34"),
            ),
          )
        ],
      ),
    );
  }
}
