import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/data/repos/address_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/address_provider.dart';
import 'package:dreamzone/screens/address/address-controller.dart';
import 'package:dreamzone/screens/address/address-form-screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/fetch_error.dart';
import 'package:dreamzone/widgets/no_item.dart';
import 'package:dreamzone/widgets/render-addres.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const routeName = "/address";
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteSmoke,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Where should we deliver?\nPlease select your delivery address",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              child: GestureDetector(
                onTap: () {
                  final addressProvider =
                      Provider.of<AddressProvider>(context, listen: false);
                  addressProvider.setSelectedAddress(
                    Address(
                      id: 0,
                      name: "Current Location",
                      phone: null,
                      description: null,
                      address:
                          "Russian Federation Blvd (110), Phnom Penh 120404",
                      latitude: "11.568121",
                      longitude: "104.889500",
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.map,
                        color: baseColor,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Use My Current Location",
                            style: TextStyle(
                              color: titleColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Base on GPS Location",
                            style: TextStyle(
                              color: descriptionColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ChangeNotifierProvider(
                create: (context) => AddressController(
                  addressRepo: locator<AddressRepo>(),
                  addressProvider: context.read<AddressProvider>(),
                ),
                child: Consumer2<AddressProvider, AddressController>(builder: (
                  context,
                  addressController,
                  deleteAddressController,
                  child,
                ) {
                  if (addressController.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (addressController.error != null) {
                    return SizedBox(
                      child: FetchError(
                        errorMessage: addressController.error.toString(),
                        onRetry: () => {},
                      ),
                    );
                  }
                  if (addressController.address.isEmpty) {
                    return const SizedBox(
                      child: NoItem(),
                    );
                  }
                  return ListView.builder(
                    itemCount: addressController.address.length,
                    itemBuilder: (context, index) {
                      return renderAddress(
                          context,
                          index,
                          addressController.address,
                          deleteAddressController,
                          addressController);
                    },
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AddressFromScreen.routeName,
                    arguments: AddressFromArgument(isCreat: true),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: iconColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Add New Address",
                      style: TextStyle(
                        color: titleColor,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderAddress(
    BuildContext context,
    int index,
    address,
    AddressController addressController,
    AddressProvider addressProvider,
  ) {
    return RenderAddress(
      address: address,
      selectedAddress: addressProvider.selectAddress,
      index: index,
      onTap: () {
        addressProvider.setSelectedAddress(address[index]);
        Navigator.pop(context);
      },
      onDelete: () {
        addressController.onDeleteAddress(address[index].id!);
      },
    );
  }
}
