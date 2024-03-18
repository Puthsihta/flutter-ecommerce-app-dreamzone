import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/home-icon.dart';
import 'package:dreamzone/widgets/image-slide.dart';
import 'package:dreamzone/widgets/render-best-selling.dart';
import 'package:dreamzone/widgets/render-feature-shop.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final List<String> _images = [
    'https://dreamzone.phsartech.com/uploads/slide/1682340854-telegram-cloud-document-5-6210643450136628041.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682340976-telegram-cloud-document-5-6210643450136628042.png',
    'https://dreamzone.phsartech.com/uploads/slide/1682341280-tg_image_229619768.png',
  ];

  final List<Product> products = [
    Product(
        name: "MAGIC AMPOULE TONER PADS សំឡីជូតមុខ",
        id: 1,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
        discount: 10,
        prices: 36),
    Product(
        name: "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
        id: 2,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400972-1.webp",
        discount: 1,
        prices: 63),
    Product(
        name: "Peptide Ampoule Mist ទឹកបាញ់មុខ",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400758-1.webp",
        discount: 15,
        prices: 99),
    Product(
        name: "Peptide Eye Cream គ្រីមលាបត្របកភ្នែក",
        id: 3,
        image:
            "https://dreamzone.phsartech.com/uploads//product/1684400559-1.webp",
        discount: 3,
        prices: 99),
    // Add more products here
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
        id: 1,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017446-WNt5m4qKlbdUTRHujeAkmwggRONlkh6J6tQRGBM1.jpg"),
    Shop(
        name: "OKA SOAP",
        id: 1,
        shopCover:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg",
        shopLogo:
            "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016410-7LPj9HwcXLKfQl38DJz8MZCHDEU0vbIyQXNajcNa.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: appBar(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ImageSlide(
                  images: _images,
                ),
                categories(),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best Selling",
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
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 90),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return renderBestSelling(context, index);
              },
              childCount: products.length,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "Feature Shops",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shop.length,
                    itemBuilder: (context, index) {
                      return renderFeatureShop(context, index);
                    }),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Products",
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
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, mainAxisExtent: 290),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return renderProduct(context, index);
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index) {
    return RenderProduct(products: products, index: index);
  }

  Widget renderFeatureShop(BuildContext context, int index) {
    return RenderFeatureShops(shop: shop, index: index);
  }

  Widget renderBestSelling(BuildContext context, int index) {
    return RenderBestSelling(products: products, index: index);
  }

  Container categories() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeIcon(
            image: 'assets/images/home/categories.png',
            title: "Categories",
          ),
          HomeIcon(
            image: 'assets/images/home/shop.png',
            title: "Shops",
          ),
          HomeIcon(
            image: 'assets/images/home/offer.png',
            title: "Specials",
          ),
          HomeIcon(
            image: 'assets/images/home/data.png',
            title: "Collections",
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: baseColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/dreamzone.png',
            fit: BoxFit.contain,
            height: 32,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/flags/uk.png',
                fit: BoxFit.cover,
                height: 25,
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_2_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
