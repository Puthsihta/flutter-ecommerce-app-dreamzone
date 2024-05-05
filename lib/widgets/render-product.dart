import 'package:cached_network_image/cached_network_image.dart';
import 'package:dreamzone/models/home.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:flutter/material.dart';

class RenderProduct extends StatelessWidget {
  final List<Product> products;
  final int index;
  final Function onTap;
  final bool isFav;

  const RenderProduct({
    super.key,
    required this.products,
    required this.index,
    required this.onTap,
    required this.isFav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
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
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                    color: baseColor,
                  ),
                ),
                imageUrl: products[index].imageUrl ?? "",
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      products[index].name ?? "",
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (products[index].discount != 0)
                                Text(
                                  currencyFormatter.format(
                                    products[index].price,
                                  ),
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: placeHolderColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                currencyFormatter.format(products[index].price),
                                style: TextStyle(
                                  fontSize:
                                      products[index].discount != 0 ? 12 : 16,
                                  color: baseColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          if (products[index].discount != 0)
                            Row(
                              children: [
                                Text(
                                  "Discout : ",
                                  style: TextStyle(
                                      fontSize: 10, color: descriptionColor),
                                ),
                                Text(
                                  // products[index].discount.toString(),
                                  currencyFormatter
                                      .format(products[index].discount),
                                  style: TextStyle(
                                      fontSize: 13, color: greenColor),
                                ),
                              ],
                            ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.add_shopping_cart,
                          color: secondColor,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
