import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:dreamzone/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopDetailScreen extends StatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  State<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
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

  @override
  Widget build(BuildContext context) {
    final Shop? propData = ModalRoute.of(context)?.settings.arguments as Shop?;
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 4,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                propData!.shopCover,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: baseColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: whiteSmoke,
                            backgroundImage: NetworkImage(propData!.shopLogo),
                          ),
                          SizedBox(width: 10),
                          Text(
                            propData!.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: titleColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.call_outlined,
                                    color: whiteSmoke,
                                    size: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Call Now",
                                    style: TextStyle(
                                      color: whiteSmoke,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: whiteSmoke,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.wordpress_outlined),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 60,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: whiteSmoke,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(Icons.home_outlined),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Store",
                              style: TextStyle(
                                color: titleColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            HTMLView(
                              htmlContent:
                                  "ក្រុមហ៊ុនLee Yuri Beauty & Health LLC នាំជូននូវផលិតផលពីអាមេរិចនិងកូរ៉េ១០០% គុណភាព និង​ សុវត្តិភាព",
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.map,
                            color: inActiveColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "PhnomPenh",
                            style: TextStyle(
                              color: descriptionColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Products",
                        style: TextStyle(
                          fontSize: 18,
                          color: titleColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/product/all',
                          );
                        },
                        child: Text(
                          "More",
                          style: TextStyle(
                            fontSize: 18,
                            color: greenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
    return RenderProduct(
      products: products,
      index: index,
      onTap: () {
        Navigator.pushNamed(context, '/product/detail',
            arguments: products[index]);
      },
    );
  }
}
