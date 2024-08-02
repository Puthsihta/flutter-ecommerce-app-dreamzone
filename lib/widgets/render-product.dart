import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
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
        margin: EdgeInsets.only(
          left: 15,
          right: index % 2 != 0 ? 15 : 0,
        ),
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
            Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TransparentImage(
                  url: products[index].image_url,
                  enableCache: true,
                  borderRadius: 10,
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      products[index].name!,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: products[index].discount != 0 ? 1 : 2,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (products[index].discount != 0)
                            Row(
                              children: [
                                Text(
                                  currencyFormatter.format(
                                      double.parse(products[index].price!)),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: placeHolderColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          Text(
                            currencyFormatter.format(
                              double.parse(products[index].price!) -
                                  ((products[index].discount! / 100) *
                                      double.parse(products[index].price!)),
                            ),
                            style: TextStyle(
                              fontSize: 15,
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
                                  fontSize: 12, color: descriptionColor),
                            ),
                            Text(
                              // products[index].discount.toString(),
                              '${products[index].discount}%',
                              style: TextStyle(
                                fontSize: 15,
                                color: discoutColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
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
