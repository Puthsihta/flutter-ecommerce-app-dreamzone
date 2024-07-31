import 'package:dreamzone/data/models/product.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';

class RenderBestSelling extends StatelessWidget {
  final List<Product> products;
  final int index;
  final Function onTap;

  const RenderBestSelling({
    super.key,
    required this.products,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
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
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: grayColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TransparentImage(
                url: products[index].image_url!,
                enableCache: true,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 65,
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
                if (products[index].discount != 0)
                  Row(
                    children: [
                      Text(
                        "Discout : ",
                        style: TextStyle(
                          fontSize: 12,
                          color: descriptionColor,
                        ),
                      ),
                      Text(
                        '${products[index].discount}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: discoutColor,
                        ),
                      ),
                    ],
                  ),
                Text(
                  currencyFormatter
                      .format(double.parse(products[index].price!)),
                  style: TextStyle(
                    fontSize: 16,
                    color: baseColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
