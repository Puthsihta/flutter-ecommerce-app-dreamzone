import 'package:dreamzone/data/models/shop.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/material.dart';

class RenderShops extends StatelessWidget {
  final List<Shop> shop;
  final int index;
  final Function onTap;

  const RenderShops({
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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TransparentImage(
                url: shop[index].logo_image,
                fit: BoxFit.cover,
                enableCache: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 100,
            child: Text(
              shop[index].name!,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
