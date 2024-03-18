import 'package:dreamzone/models/provices.model.dart';
import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/image-slide.dart';
import 'package:dreamzone/widgets/render-provices.dart';
import 'package:dreamzone/widgets/render-shops.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final List<String> _images = [
    'https://dreamzone.phsartech.com/uploads/slide/1682340854-telegram-cloud-document-5-6210643450136628041.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682340976-telegram-cloud-document-5-6210643450136628042.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682341280-tg_image_229619768.png',
  ];

  final List<Provices> provices = [
    Provices(
        name: "Phnom Penh",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/pp.jpeg"),
    Provices(
        name: "Kandal",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/kandal.jpeg"),
    Provices(
        name: "Kampong Thom",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/kpt.jpeg"),
    Provices(
        name: "Battambang",
        id: 1,
        url: "https://www.dreamzonekh.com/uploads/provinces/btb.jpeg"),
  ];

  final List<Shop> shop = [
    Shop(
        name: "Japan Store",
        id: 1,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 2,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 3,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
    Shop(
        name: "Japan Store",
        id: 4,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 5,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 6,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
    Shop(
        name: "Japan Store",
        id: 7,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"),
    Shop(
        name: "FlOWER DREAM SHOP",
        id: 8,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 9,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(
          'Shops',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 27,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: ImageSlide(
                    images: _images,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: const Text(
                    "Provices",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 15),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return renderProvices(context, index);
                },
                childCount: provices.length,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: whiteSmoke,
                height: 12,
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: const Text(
                  "Shop Features",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                mainAxisExtent: 120,
                crossAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return renderFeaturShop(context, index);
                },
                childCount: 5,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: whiteSmoke,
                height: 12,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shops",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "More",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                      ])),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 15,
                mainAxisExtent: 120,
                crossAxisSpacing: 15,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return renderShop(context, index);
                },
                childCount: shop.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProvices(BuildContext context, int index) {
    return RenderProvices(provices: provices, index: index);
  }

  Widget renderFeaturShop(BuildContext context, int index) {
    return RenderShops(shop: shop, index: index);
  }

  Widget renderShop(BuildContext context, int index) {
    return RenderShops(shop: shop, index: index);
  }
}
