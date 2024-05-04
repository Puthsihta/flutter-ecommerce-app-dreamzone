import 'package:dreamzone/models/shop.model.dart';
import 'package:dreamzone/providers/product-detail.provider.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/webview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final int? id;
  const ProductDetailScreen({super.key, this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Future<void> onRefresh() async {
    // Simulate a time-consuming task
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    // print("ID : ${widget.id}");
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ProductDetailProvider>(context, listen: false)
            .getProductDetail(widget.id ?? 1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProductDetailProvider>(
        builder: (context, productDetail, child) {
          if (productDetail.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.35,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  // background: Image.network(
                  //   propData!.image,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                backgroundColor: baseColor,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container(
                              //   width: 250,
                              //   child: Text(
                              //     propData!.name,
                              //     overflow: TextOverflow.ellipsis,
                              //     softWrap: false,
                              //     maxLines: 3,
                              //     style: TextStyle(
                              //         fontSize: 18, fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              // Text(
                              //   currencyFormatter.format(propData!.prices),
                              //   style: TextStyle(
                              //     color: baseColor,
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 18,
                              //   ),
                              // ),
                              Text(
                                "Pv : 5pts",
                                style: TextStyle(
                                  color: descriptionColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_outline,
                                    color: baseColor,
                                  )),
                              Text(
                                "#d24332",
                                style: TextStyle(
                                  color: descriptionColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                              color: descriptionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: descriptionColor,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: descriptionColor,
                                  ),
                                  onPressed: () {},
                                ),
                                Container(
                                  height: 40,
                                  child: const Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 62, 44, 44),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon:
                                      Icon(Icons.add, color: descriptionColor),
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: HTMLView(
                        htmlContent:
                            "PRODUCT NAME: Mind, Brain memory matrix\r\n\r\nITEM FORM: Capsules\r\n\r\nUNIT COUNT: 30\r\n\r\nSUGGESTED DOSAGE: 1 capsule to be taken 1 or 2 times daily preferably with a meal.\r\n\r\nDESCRIPTION: Mind, Brain memory matrix is a plant-based supplement backed by clinical studies that demonstrate significant improvements in memory, including long-term memory, spatial memory, and word recall. Made with a blend of ingredients formulated to boost your memory and brain function, it helps deliver essential oxygen and nutrients to your brain to support optimal cognitive function. It works best to improve mental performance and nourish your mind when taken daily. Use this supplement to fight mental sluggishness and brain fog, and improve productivity. For maximum natural brain support and mental clarity, we recommend consuming food.\r\n\r\nCAUTION: AVOID EXCEEDING RECOMMENDED DOSE. Children under the age of 18, pregnant or nursing mothers, and those with a known medical condition should consult with a physician before using this or any other dietary supplement.\r\n\r\n \r\n\r\nផលិតផលជំនួយខួរក្បាលនិងអង្គចងចាំ មាន30 គ្រាប់\r\n\r\n👉ញាំ1ថ្ងៃ 1 គ្រាប់ ញាំបាន1 ខែ\r\n\r\n👉ញាំបន្ទាប់ពីពិសារបាយហើយថ្ងៃត្រង់ឫល្ងាចក៏បាន\r\n\r\n❌ហាមញាំចំពោះអ្នកមានផ្ទៃពោះ ឫក្រោម អាយុ18\r\n\r\n❌ហាមញាំលើសចំនួនដែលបានកំណត់\r\n\r\n❌ហាមញាំគូរភរិយាចង់មានផ្ទៃពោះ\r\n\r\n❌ហាមញាំបើអ្នកជម្ងឺមានប្រវត្តឈាមកក",
                      ),
                    ),
                    Container(
                      height: 15,
                      color: whiteSmoke,
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Store Profile",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: titleColor,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                width: 250,
                                child: Text(
                                  "Less Yuri Health & Beutity",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: descriptionColor,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: inActiveColor,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "092389497",
                                    style: TextStyle(
                                      color: descriptionColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    whiteSmoke,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/shop/detail',
                                      arguments: Shop(
                                          name: "Japan Store",
                                          id: 1,
                                          shopCover:
                                              "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
                                          shopLogo:
                                              "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"));
                                },
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                    color: greenColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg",
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 15,
                      color: whiteSmoke,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Related Products",
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
              // SliverPadding(
              //   padding: const EdgeInsets.only(
              //     bottom: 15,
              //   ),
              //   sliver: SliverGrid(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 15,
              //         mainAxisExtent: 290),
              //     delegate: SliverChildBuilderDelegate(
              //       (BuildContext context, int index) {
              //         // return renderProduct(context, index);
              //       },
              //       childCount: products.length,
              //     ),
              //   ),
              // ),
            ],
          );
        },
      ),
      // CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       pinned: true,
      //       expandedHeight: MediaQuery.of(context).size.height * 0.35,
      //       flexibleSpace: FlexibleSpaceBar(
      //         centerTitle: true,
      //         // background: Image.network(
      //         //   propData!.image,
      //         //   fit: BoxFit.cover,
      //         // ),
      //       ),
      //       backgroundColor: baseColor,
      //     ),
      //     SliverList(
      //       delegate: SliverChildListDelegate(
      //         [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     // Container(
      //                     //   width: 250,
      //                     //   child: Text(
      //                     //     propData!.name,
      //                     //     overflow: TextOverflow.ellipsis,
      //                     //     softWrap: false,
      //                     //     maxLines: 3,
      //                     //     style: TextStyle(
      //                     //         fontSize: 18, fontWeight: FontWeight.bold),
      //                     //   ),
      //                     // ),
      //                     // Text(
      //                     //   currencyFormatter.format(propData!.prices),
      //                     //   style: TextStyle(
      //                     //     color: baseColor,
      //                     //     fontWeight: FontWeight.bold,
      //                     //     fontSize: 18,
      //                     //   ),
      //                     // ),
      //                     Text(
      //                       "Pv : 5pts",
      //                       style: TextStyle(
      //                         color: descriptionColor,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 15,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     IconButton(
      //                         onPressed: () {},
      //                         icon: Icon(
      //                           Icons.favorite_outline,
      //                           color: baseColor,
      //                         )),
      //                     Text(
      //                       "#d24332",
      //                       style: TextStyle(
      //                         color: descriptionColor,
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 15,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.all(8),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   "Quantity",
      //                   style: TextStyle(
      //                     color: descriptionColor,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 120,
      //                   height: 40,
      //                   decoration: BoxDecoration(
      //                     border: Border.all(
      //                       color: descriptionColor,
      //                       width: 0.5,
      //                     ),
      //                     borderRadius: BorderRadius.circular(20),
      //                   ),
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       IconButton(
      //                         icon: Icon(
      //                           Icons.remove,
      //                           color: descriptionColor,
      //                         ),
      //                         onPressed: () {},
      //                       ),
      //                       Container(
      //                         height: 40,
      //                         child: const Center(
      //                           child: Text(
      //                             '1',
      //                             style: TextStyle(
      //                               color: Color.fromARGB(255, 62, 44, 44),
      //                               fontSize: 15,
      //                             ),
      //                           ),
      //                         ),
      //                       ),
      //                       IconButton(
      //                         icon: Icon(Icons.add, color: descriptionColor),
      //                         onPressed: () {},
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: EdgeInsets.all(8),
      //             child: HTMLView(
      //               htmlContent:
      //                   "PRODUCT NAME: Mind, Brain memory matrix\r\n\r\nITEM FORM: Capsules\r\n\r\nUNIT COUNT: 30\r\n\r\nSUGGESTED DOSAGE: 1 capsule to be taken 1 or 2 times daily preferably with a meal.\r\n\r\nDESCRIPTION: Mind, Brain memory matrix is a plant-based supplement backed by clinical studies that demonstrate significant improvements in memory, including long-term memory, spatial memory, and word recall. Made with a blend of ingredients formulated to boost your memory and brain function, it helps deliver essential oxygen and nutrients to your brain to support optimal cognitive function. It works best to improve mental performance and nourish your mind when taken daily. Use this supplement to fight mental sluggishness and brain fog, and improve productivity. For maximum natural brain support and mental clarity, we recommend consuming food.\r\n\r\nCAUTION: AVOID EXCEEDING RECOMMENDED DOSE. Children under the age of 18, pregnant or nursing mothers, and those with a known medical condition should consult with a physician before using this or any other dietary supplement.\r\n\r\n \r\n\r\nផលិតផលជំនួយខួរក្បាលនិងអង្គចងចាំ មាន30 គ្រាប់\r\n\r\n👉ញាំ1ថ្ងៃ 1 គ្រាប់ ញាំបាន1 ខែ\r\n\r\n👉ញាំបន្ទាប់ពីពិសារបាយហើយថ្ងៃត្រង់ឫល្ងាចក៏បាន\r\n\r\n❌ហាមញាំចំពោះអ្នកមានផ្ទៃពោះ ឫក្រោម អាយុ18\r\n\r\n❌ហាមញាំលើសចំនួនដែលបានកំណត់\r\n\r\n❌ហាមញាំគូរភរិយាចង់មានផ្ទៃពោះ\r\n\r\n❌ហាមញាំបើអ្នកជម្ងឺមានប្រវត្តឈាមកក",
      //             ),
      //           ),
      //           Container(
      //             height: 15,
      //             color: whiteSmoke,
      //           ),
      //           Padding(
      //             padding: EdgeInsets.all(12),
      //             child: Row(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       "Store Profile",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         color: titleColor,
      //                         fontSize: 18,
      //                       ),
      //                     ),
      //                     Container(
      //                       margin: EdgeInsets.symmetric(vertical: 5),
      //                       width: 250,
      //                       child: Text(
      //                         "Less Yuri Health & Beutity",
      //                         overflow: TextOverflow.ellipsis,
      //                         softWrap: false,
      //                         maxLines: 3,
      //                         style: TextStyle(
      //                           fontSize: 15,
      //                           color: descriptionColor,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ),
      //                     Row(
      //                       children: [
      //                         Icon(
      //                           Icons.map,
      //                           color: inActiveColor,
      //                           size: 18,
      //                         ),
      //                         SizedBox(
      //                           width: 5,
      //                         ),
      //                         Text(
      //                           "PhnomPenh",
      //                           style: TextStyle(
      //                             color: descriptionColor,
      //                             fontSize: 15,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       children: [
      //                         Icon(
      //                           Icons.phone,
      //                           color: inActiveColor,
      //                           size: 18,
      //                         ),
      //                         SizedBox(
      //                           width: 5,
      //                         ),
      //                         Text(
      //                           "092389497",
      //                           style: TextStyle(
      //                             color: descriptionColor,
      //                             fontSize: 15,
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 10,
      //                     ),
      //                     TextButton(
      //                       style: ButtonStyle(
      //                         backgroundColor: MaterialStateProperty.all<Color>(
      //                           whiteSmoke,
      //                         ),
      //                       ),
      //                       onPressed: () {
      //                         Navigator.pushNamed(context, '/shop/detail',
      //                             arguments: Shop(
      //                                 name: "Japan Store",
      //                                 id: 1,
      //                                 shopCover:
      //                                     "https://dreamzone.phsartech.com/uploads/uploads/shop/1683017650-best-shopping-in-japan-akihabara.jpg",
      //                                 shopLogo:
      //                                     "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg"));
      //                       },
      //                       child: Text(
      //                         "More",
      //                         style: TextStyle(
      //                           color: greenColor,
      //                         ),
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //                 ClipRRect(
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Image.network(
      //                     "https://dreamzone.phsartech.com/uploads/uploads/shop/1683016085-%20.jpeg",
      //                     width: 50,
      //                     height: 50,
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Container(
      //             height: 15,
      //             color: whiteSmoke,
      //           ),
      //           Padding(
      //             padding:
      //                 const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   "Related Products",
      //                   style: TextStyle(
      //                     fontSize: 18,
      //                     color: titleColor,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 GestureDetector(
      //                   onTap: () {
      //                     Navigator.pushNamed(
      //                       context,
      //                       '/product/all',
      //                     );
      //                   },
      //                   child: Text(
      //                     "More",
      //                     style: TextStyle(
      //                       fontSize: 18,
      //                       color: greenColor,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     // SliverPadding(
      //     //   padding: const EdgeInsets.only(
      //     //     bottom: 15,
      //     //   ),
      //     //   sliver: SliverGrid(
      //     //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     //         crossAxisCount: 2,
      //     //         mainAxisSpacing: 15,
      //     //         mainAxisExtent: 290),
      //     //     delegate: SliverChildBuilderDelegate(
      //     //       (BuildContext context, int index) {
      //     //         // return renderProduct(context, index);
      //     //       },
      //     //       childCount: products.length,
      //     //     ),
      //     //   ),
      //     // ),
      //   ],
      // ),
    );
  }

  // Widget renderProduct(BuildContext context, int index) {
  //   return RenderProduct(
  //     products: products,
  //     index: index,
  //     onTap: () {
  //       Navigator.pushNamed(context, '/product/detail',
  //           arguments: products[index]);
  //     },
  //     isFav: false,
  //   );
  // }
}
