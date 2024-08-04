import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/cart.dart';
import 'package:dreamzone/data/models/requests/order-request.dart';
import 'package:dreamzone/data/repos/order_product_repo.dart';
import 'package:dreamzone/data/repos/payment_method_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/address_provider.dart';
import 'package:dreamzone/providers/cart_provider.dart';
import 'package:dreamzone/screens/cart/order-product-controller.dart';
import 'package:dreamzone/screens/cart/payment-controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/utils/index.dart';
import 'package:dreamzone/widgets/custom-button.dart';
import 'package:dreamzone/widgets/render-horizontal-address.dart';
import 'package:dreamzone/widgets/render-payment-method.dart';
import 'package:dreamzone/widgets/transparent_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class OrderProductScreen extends StatefulWidget {
  static const routeName = "/cart/order";

  final OrderProductArgument argument;
  const OrderProductScreen({super.key, required this.argument});

  @override
  State<OrderProductScreen> createState() => _OrderProductScreenState();
}

class _OrderProductScreenState extends State<OrderProductScreen> {
  late TextEditingController remark = TextEditingController();

  @override
  void dispose() {
    remark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    // print("isKeyboardVisible : $isKeyboardVisible");
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: const Text("Payment"),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => PaymentMethodController(
                paymentMethodController: locator<PaymentMethodRepo>())
              ..getPaymentMethod(),
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProductController(
              orderRepo: locator<OrderRepo>(),
              onOrderError: (message) {
                showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) => AlertDialog.adaptive(
                    title: const Text("Order Product Fail"),
                    content: Text(message.toString()),
                  ),
                );
              },
              onOrderSuccess: () {
                print("Order successfully");
                final cartProvider =
                    Provider.of<CartProvider>(context, listen: false);
                cartProvider.onRemoveShop(
                    shopId: widget.argument.cart.shop!.id!);
                Navigator.pushNamed(context, '/order/payment-success');
              },
            ),
          ),
        ],
        child: Consumer4<PaymentMethodController, AddressProvider, CartProvider,
            OrderProductController>(
          builder: (
            context,
            paymentMethodController,
            addressController,
            cartProvider,
            orderController,
            child,
          ) {
            if (paymentMethodController.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Stack(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Delivery Address",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              height: 150,
                              color: Colors.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: GoogleMap(
                                  initialCameraPosition: const CameraPosition(
                                    target: LatLng(37.7749,
                                        -122.4194), // Set your initial location
                                    zoom: 10,
                                  ),
                                  // onTap: (argument) {
                                  //   Navigator.of(context).pushNamed(
                                  //     UpdateLocationScreen.routeName,
                                  //     arguments: UpdateLocationArgument(),
                                  //   );
                                  // },
                                  myLocationEnabled: false,
                                  myLocationButtonEnabled: false,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    // You can perform additional map setup here if needed
                                  },
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              margin: const EdgeInsets.only(top: 10),
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: addressController.address.length,
                                itemBuilder: (context, index) {
                                  return renderAddress(
                                    context,
                                    index,
                                    addressController.address,
                                    addressController,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Payment Methods",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: paymentMethodController
                                  .paymenthMethod!.length,
                              itemBuilder: (context, index) {
                                return renderPaymentMethod(
                                  context,
                                  index,
                                  paymentMethodController,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Order Summary",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const Divider(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: widget
                                              .argument.cart.shop!.logo_image !=
                                          null
                                      ? TransparentImage(
                                          url: widget
                                              .argument.cart.shop!.logo_image!,
                                        )
                                      : Image.asset("assets/images/logo.png"),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${widget.argument.cart.shop!.name}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: titleColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  widget.argument.cart.product.values.length,
                              itemBuilder: (context, index) {
                                return renderProduct(
                                  context,
                                  index,
                                  widget.argument.cart.product.values,
                                );
                              },
                            ),
                            const Divider(
                              height: 20,
                              indent: 100,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sub Total",
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(
                                      cartProvider.getSubTotalPrice(
                                          shopId:
                                              widget.argument.cart.shop!.id!),
                                    ),
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Packing Fee",
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(0),
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Fee",
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "(Free Delivery)",
                                        style: TextStyle(
                                          color: baseColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        currencyFormatter.format(0),
                                        style: TextStyle(
                                          color: baseColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount",
                                    style: TextStyle(
                                      color: titleColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(
                                      cartProvider.getTotalDiscount(
                                          shopId:
                                              widget.argument.cart.shop!.id!),
                                    ),
                                    style: TextStyle(
                                      color: discoutColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Payble (incl. VAT)",
                                    style: TextStyle(
                                      color: discoutColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(
                                      cartProvider.getTotal(
                                          shopId:
                                              widget.argument.cart.shop!.id!),
                                    ),
                                    style: TextStyle(
                                      color: discoutColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Order Remark",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextField(
                              controller: remark,
                              maxLines: null,
                              cursorColor: placeHolderColor,
                              style: TextStyle(color: titleColor, fontSize: 15),
                              decoration: InputDecoration(
                                labelText: "Remark",
                                hintText: 'Noted something here ...',
                                labelStyle: const TextStyle(
                                  color: Colors.grey, // Color when not focused
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: placeHolderColor,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12 + MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
                if (!isKeyboardVisible)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: MediaQuery.of(context).padding.bottom,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Colors.white,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CustomButton(
                        onPressed: () {
                          if (addressController.selectAddress.id == 0) {
                            showCupertinoDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) => const AlertDialog.adaptive(
                                title: Text("Select address"),
                                content:
                                    Text("Please select address delivery!"),
                              ),
                            );
                            return;
                          }
                          if (paymentMethodController.selectedPaymentMethod ==
                              null) {
                            showCupertinoDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) => const AlertDialog.adaptive(
                                title: Text("Select payment method"),
                                content: Text("Please select payment method"),
                              ),
                            );
                            return;
                          }
                          List<ProductOrder>? products = [];
                          for (var i in widget.argument.cart.product.values) {
                            products.add(ProductOrder(
                              id: i.product.id!,
                              quantity: i.quantity,
                            ));
                          }
                          orderController.onOrderProduct(
                            RequestOrder(
                              shop_id: widget.argument.cart.shop!.id!,
                              address_id: addressController.selectAddress.id!,
                              payment_id: paymentMethodController
                                  .selectedPaymentMethod!.id!,
                              product: products,
                              remarks: remark.text,
                            ),
                          );
                        },
                        child: Text(
                          "Place Order ${currencyFormatter.format(cartProvider.getTotal(shopId: widget.argument.cart.shop!.id!))}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget renderPaymentMethod(
      BuildContext context, int index, PaymentMethodController paymentMethod) {
    return RenderPaymentMethod(
      paymentMethod: paymentMethod.paymenthMethod!,
      index: index,
      onTap: () {
        paymentMethod.selectedPaymentMethod =
            paymentMethod.paymenthMethod![index];
      },
      disable: false,
      selectedPaymentMethod: paymentMethod.selectedPaymentMethod,
    );
  }

  Widget renderAddress(
    BuildContext context,
    int index,
    address,
    AddressProvider addressProvider,
  ) {
    return RenderHorizontalAddress(
      address: address,
      index: index,
      selectedAddress: addressProvider.selectAddress,
      onTap: () {
        addressProvider.setSelectedAddress(address[index]);
      },
    );
  }

  Widget renderProduct(
      BuildContext context, int index, Iterable<ProductItem> product) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          // ignore: unnecessary_null_comparison
          child: product.elementAt(index).product.image_url != null
              ? SizedBox(
                  width: 90,
                  height: 90,
                  child: TransparentImage(
                    url: product.elementAt(index).product.image_url,
                  ),
                )
              : Image.asset("assets/images/logo.png"),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 230,
              child: Text(
                product.elementAt(index).product.name!,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  color: titleColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (product.elementAt(index).discount != 0)
              Row(
                children: [
                  Text(
                    "Discount : ",
                    style: TextStyle(
                      fontSize: 12,
                      color: descriptionColor,
                    ),
                  ),
                  Text(
                    "${product.elementAt(index).discount.toString()}%",
                    style: TextStyle(
                      fontSize: 15,
                      color: discoutColor,
                    ),
                  )
                ],
              ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 230,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (product.elementAt(index).discount != 0)
                        Text(
                          currencyFormatter.format(
                            double.parse(
                                product.elementAt(index).product.price!),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: descriptionColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        currencyFormatter.format(double.parse(
                                product.elementAt(index).product.price!) -
                            ((product.elementAt(index).discount / 100) *
                                double.parse(
                                    product.elementAt(index).product.price!))),
                        style: TextStyle(
                          fontSize: 15,
                          color: baseColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "x${product.elementAt(index).quantity.toString()}",
                    style: TextStyle(
                      fontSize: 18,
                      color: titleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
