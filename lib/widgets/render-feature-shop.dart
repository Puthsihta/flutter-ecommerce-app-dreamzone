import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';

class RenderFeatureShops extends StatelessWidget {
  final List<Shop> shop;
  final int index;
  final Function onTap;

  const RenderFeatureShops({
    super.key,
    required this.shop,
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
        padding: EdgeInsets.only(right: 15, left: index == 0 ? 15 : 0),
        child: Stack(
          children: [
            // Background image
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(1),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.4,
                  image: NetworkImage(
                    shop[index].cover_image!,
                  ),
                ),
              ),
              width: 300, // Adjust opacity as needed
            ),

            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    shop[index].name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 50,
                        height: 50,
                        child: TransparentImage(
                          url: shop[index].logo_image!,
                          enableCache: true,
                        ),
                      ),
                    ),
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
