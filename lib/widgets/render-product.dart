import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/material.dart';

class RenderProduct extends StatelessWidget {
  final List<Product> products;
  final int index;

  const RenderProduct({super.key, required this.products, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: index % 2 != 0 ? 15 : 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              products[index].image,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  child: Flexible(
                    child: Text(
                      products[index].name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              currencyFormatter.format(products[index].prices),
                              style: TextStyle(
                                fontSize: 12,
                                color: placeHolderColor,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              currencyFormatter.format(products[index].prices),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: baseColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
                              currencyFormatter
                                  .format(products[index].discount),
                              style: TextStyle(fontSize: 13, color: greenColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: secondColor,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
