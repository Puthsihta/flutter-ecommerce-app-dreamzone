import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
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
      padding: EdgeInsets.all(10),
      height: 130,
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              cart[index].image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                child: Flexible(
                  child: Text(
                    cart[index].name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Discout : ",
                    style: TextStyle(fontSize: 12, color: descriptionColor),
                  ),
                  Text(
                    // products[index].discount.toString(),
                    currencyFormatter.format(cart[index].discount),
                    style: TextStyle(fontSize: 13, color: greenColor),
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
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: 12),
                  Text(
                    currencyFormatter
                        .format(cart[index].prices - cart[index].discount),
                    style: TextStyle(
                        fontSize: 15,
                        color: baseColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: descriptionColor,
                            ),
                            onPressed: () {},
                          ),
                          Container(
                            height: 40,
                            width: 50,
                            child: Center(
                              child: TextField(
                                controller: TextEditingController(text: '1'),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1',
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
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text("Delete Cart?"),
                                  actions: [
                                    CupertinoDialogAction(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ],
                                  content: Text("You can add more cart!"),
                                );
                              });
                        },
                        icon: Icon(Icons.delete_outline, color: secondColor))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
