import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/material.dart';

class RenderBestSelling extends StatelessWidget {
  final List<Product> products;
  final int index;

  const RenderBestSelling(
      {super.key, required this.products, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: index % 2 != 0 ? 15 : 0),
      padding: const EdgeInsets.all(10),
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
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              products[index].image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 85,
                child: Flexible(
                  child: Text(
                    products[index].name,
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
                    style: TextStyle(fontSize: 10, color: descriptionColor),
                  ),
                  Text(
                    // products[index].discount.toString(),
                    currencyFormatter.format(products[index].discount),
                    style: TextStyle(fontSize: 13, color: greenColor),
                  ),
                ],
              ),
              Text(
                currencyFormatter.format(products[index].prices),
                style: TextStyle(
                    fontSize: 14,
                    color: baseColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
