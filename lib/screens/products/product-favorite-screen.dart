import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/models/products.model.dart';
import 'package:dreamzone/screens/products/product-detail-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:flutter/material.dart';

class ProductFavoriteScreen extends StatefulWidget {
  static const routeName = "/product/favorite";
  const ProductFavoriteScreen({super.key});

  @override
  State<ProductFavoriteScreen> createState() => _ProductFavoriteScreenState();
}

class _ProductFavoriteScreenState extends State<ProductFavoriteScreen> {
  final List<Product> products = [
    Product(
      name: "MAGIC AMPOULE TONER PADS សំឡីជូតមុខ",
      id: 1,
      image:
          "https://dreamzone.phsartech.com/uploads//product/1684401424-1.webp",
      discount: 10,
      prices: 36,
    ),
    Product(
      name: "HYDRATING CLEANSING BALM ជួយសម្អាត Make Up",
      id: 2,
      image:
          "https://dreamzone.phsartech.com/uploads//product/1684400972-1.webp",
      discount: 1,
      prices: 63,
    ),
    Product(
      name: "Peptide Ampoule Mist ទឹកបាញ់មុខ",
      id: 3,
      image:
          "https://dreamzone.phsartech.com/uploads//product/1684400758-1.webp",
      discount: 15,
      prices: 99,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Favorite"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(top: 15),
        itemCount: products.length, // Number of items in the grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          mainAxisExtent: 290,
        ),
        itemBuilder: (BuildContext context, int index) {
          // itemBuilder function for building each grid item
          return renderProduct(context, index);
        },
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index) {
    return RenderProduct(
      products: [],
      index: index,
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   ProductDetailScreen.routeName,
        //   arguments: ProductDetailArgument(
        //     product: products[index],
        //   ),
        // );
      },
      isFav: true,
    );
  }
}
