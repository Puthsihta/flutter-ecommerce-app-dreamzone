import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/product_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/screens/products/product_controller.dart';
import 'package:dreamzone/screens/product_detail/product_detail_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/debounce.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = "/product/all";
  final ProductArgument argument;
  const ProductScreen({super.key, required this.argument});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductScreenController searchViewController;
  final _scrollController = ScrollController();
  double boundaryOffset = 0.8;
  bool showSearchBar = false;
  final searchController = TextEditingController();

  final debouncer = Debouncer(milliseconds: 500);

  void scrollListener() {
    _scrollController.addListener(() {
      final nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        searchViewController.onFetchNextPage();
      }
    });
  }

  void searchListener() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        searchViewController.onGetProduct(
          search: "",
          shopId: widget.argument.shopId,
          cateId: widget.argument.cateId,
          subCateId: widget.argument.subCateId,
        );
      } else {
        debouncer.run(() {
          searchViewController.onGetProduct(
            search: searchController.text,
            shopId: widget.argument.shopId,
            cateId: widget.argument.cateId,
            subCateId: widget.argument.subCateId,
          );
        });
      }
    });
  }

  @override
  void initState() {
    searchListener();
    scrollListener();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    searchController.dispose();
    _scrollController.dispose();
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(widget.argument.name ?? l10n!.products),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 27,
            ),
            onPressed: () {
              setState(() {
                showSearchBar = true;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (showSearchBar || widget.argument.name == l10n!.search_placeholder)
            Container(
              color: baseColor,
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                controller: searchController,
                autofocus: widget.argument.name == l10n!.search_placeholder ||
                        showSearchBar
                    ? true
                    : false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: baseColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: whiteSmoke,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      if (searchController.text.isEmpty) {
                        setState(() {
                          showSearchBar = false;
                        });
                      } else {
                        searchController.clear();
                      }
                    },
                    child: Visibility(
                      visible: true,
                      child: Icon(
                        Icons.cancel,
                        color: placeHolderColor,
                      ),
                    ),
                  ),
                  hintText: l10n.search_placeholder,
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) =>
                  ProductScreenController(productRepo: locator<ProductRepo>())
                    ..onGetProduct(
                      shopId: widget.argument.shopId,
                      cateId: widget.argument.cateId,
                      subCateId: widget.argument.subCateId,
                    ),
              child: Consumer<ProductScreenController>(
                builder: (context, viewController, child) {
                  searchViewController = viewController;
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
                        onRetry: () => viewController.onGetProduct(),
                      ),
                    );
                  }
                  if (viewController.products.isEmpty) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const NoItem(),
                    );
                  }
                  return Column(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () =>
                              searchViewController.onGetProduct(refresh: true),
                          child: CustomScrollView(
                            controller: _scrollController,
                            slivers: [
                              const SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 15,
                                ),
                              ),
                              SliverGrid(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 15,
                                  mainAxisExtent: 290,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                    return renderProduct(context, index,
                                        viewController.products);
                                  },
                                  childCount: viewController.products.length,
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: viewController.loadingFetchNext
                                    ? const SizedBox(
                                        height: 100,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : !viewController.hasNextPage
                                        ? SizedBox(
                                            height: 100,
                                            child: Center(
                                              child: Text(l10n.no_more_data),
                                            ),
                                          )
                                        : const SizedBox(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget renderProduct(BuildContext context, int index, products) {
    return RenderProduct(
      products: products,
      index: index,
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: ProductDetailArgument(
            product: products[index],
          ),
        );
      },
      isFav: false,
    );
  }
}
