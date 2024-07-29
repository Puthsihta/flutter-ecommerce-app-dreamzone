import 'package:dreamzone/data/repos/product_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/products/product-favorite-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render-product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductFavoriteScreen extends StatefulWidget {
  static const routeName = "/product/favorite";
  const ProductFavoriteScreen({super.key});

  @override
  State<ProductFavoriteScreen> createState() => _ProductFavoriteScreenState();
}

class _ProductFavoriteScreenState extends State<ProductFavoriteScreen> {
  late ProductFavoriteController productFavoriteController;
  final scrollController = ScrollController();
  double boundaryOffset = 0.8;

  void scrollListener() {
    scrollController.addListener(() {
      final nextPageTrigger = 0.8 * scrollController.position.maxScrollExtent;
      if (scrollController.position.pixels > nextPageTrigger) {
        productFavoriteController.onFetchNextPage();
      }
    });
  }

  @override
  void initState() {
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Favorite"),
      ),
      body: ChangeNotifierProvider(
        create: (context) =>
            ProductFavoriteController(productRepo: locator<ProductRepo>())
              ..onGetFavoriteProduct(),
        child: Consumer<ProductFavoriteController>(
            builder: (context, viewController, child) {
          if (viewController.loadingInitial) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (viewController.error != null) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: FetchError(
                errorMessage: viewController.error.toString(),
                onRetry: () => viewController.onGetFavoriteProduct(),
              ),
            );
          }
          if (viewController.products.isEmpty) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const NoItem(),
            );
          }
          return RefreshIndicator(
            onRefresh: () => viewController.onGetFavoriteProduct(refresh: true),
            child: GridView.builder(
              padding: const EdgeInsets.only(top: 15),
              itemCount:
                  viewController.products.length, // Number of items in the grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                mainAxisExtent: 290,
              ),
              itemBuilder: (BuildContext context, int index) {
                // itemBuilder function for building each grid item
                return renderProduct(context, index, viewController.products);
              },
            ),
          );
        }),
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index, products) {
    return RenderProduct(
      products: products,
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
