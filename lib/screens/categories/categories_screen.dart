import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/repos/categories_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/home_provider.dart';
import 'package:dreamzone/screens/categories/categories_controller.dart';
import 'package:dreamzone/screens/products/product_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorieScreen extends StatefulWidget {
  static const routeName = "/categories";
  const CategorieScreen({super.key});
  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  late int cateID = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(l10n!.categories),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CategoriesScreenController(
          categoriesRepo: locator<CategoriesRespo>(),
        )..getSubCategoriesData(cateID),
        child: Consumer2<HomeProvider, CategoriesScreenController>(
            builder: (context, homeController, categoriesController, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: whiteSmoke,
            child: Row(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width / 3.5,
                  child: ListView.builder(
                    itemCount: homeController.homeData!.categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final id =
                              homeController.homeData!.categories[index].id;
                          if (id != null) {
                            if (cateID != id) {
                              categoriesController.getSubCategoriesData(id);
                            }
                            setState(() {
                              cateID = id;
                            });
                          }
                        },
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                            color: cateID ==
                                    homeController
                                        .homeData!.categories[index].id
                                ? whiteSmoke
                                : Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: whiteSmoke,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              homeController.homeData!.categories[index].name!,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                categoriesController.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        color: whiteSmoke,
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: RefreshIndicator(
                          onRefresh: () =>
                              categoriesController.getSubCategoriesData(cateID),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, // Number of columns
                              crossAxisSpacing: 10, // Spacing between columns
                              mainAxisSpacing: 10, // Spacing between rows
                            ),
                            itemCount: categoriesController
                                .subCateData!.subCategories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ProductScreen.routeName,
                                    arguments: ProductArgument(
                                      subCateId: categoriesController
                                          .subCateData!.subCategories[index].id,
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 0.5,
                                        blurRadius: 0.5,
                                        offset: const Offset(
                                          0,
                                          1,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/home/categories.png",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.contain,
                                      ),
                                      Text(
                                        categoriesController.subCateData!
                                            .subCategories[index].name!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: titleColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
