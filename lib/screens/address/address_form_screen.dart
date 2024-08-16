import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/requests/create_address.dart';
import 'package:dreamzone/data/repos/address_repo.dart';
import 'package:dreamzone/locator.dart';
import 'package:dreamzone/providers/address_provider.dart';
import 'package:dreamzone/providers/user_provider.dart';
import 'package:dreamzone/screens/address/address_controller.dart';
import 'package:dreamzone/screens/address/update_location_screen.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom_button.dart';
import 'package:dreamzone/widgets/customz_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class AddressFromScreen extends StatefulWidget {
  static const routeName = "/address/form";

  final AddressFromArgument argument;
  const AddressFromScreen({super.key, required this.argument});

  @override
  State<AddressFromScreen> createState() => _AddressFromScreenState();
}

class _AddressFromScreenState extends State<AddressFromScreen> {
  late TextEditingController name = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController remark = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (widget.argument.isCreat) {
      phone = TextEditingController(text: userProvider.user!.phone);
    } else {
      name = TextEditingController(text: widget.argument.address!.name);
      phone = TextEditingController(text: widget.argument.address!.phone);
      remark =
          TextEditingController(text: widget.argument.address!.description);
    }
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    remark.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(
          widget.argument.isCreat ? "Create Address" : "Update Address",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          UpdateLocationScreen.routeName,
                          arguments: UpdateLocationArgument(),
                        );
                      },
                      child: Container(
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
                            onTap: (argument) {
                              Navigator.of(context).pushNamed(
                                UpdateLocationScreen.routeName,
                                arguments: UpdateLocationArgument(),
                              );
                            },
                            myLocationEnabled: false,
                            myLocationButtonEnabled: false,
                            onMapCreated: (GoogleMapController controller) {
                              // You can perform additional map setup here if needed
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Your Location",
                        style: TextStyle(
                          color: titleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    CustomTextInput(
                      label: 'Name',
                      hintText: 'Receiver Name',
                      controller: name,
                      prefixIcon: Icon(
                        Icons.person,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 15),
                    CustomTextInput(
                      label: 'Phone',
                      hintText: 'Enter your your',
                      controller: phone,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    CustomTextInput(
                      label: 'Remark',
                      hintText: 'House number, landmark (optional)',
                      controller: remark,
                      prefixIcon: Icon(
                        Icons.map,
                        color: placeHolderColor,
                      ),
                      enable: true,
                      keyboardType: TextInputType.streetAddress,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ChangeNotifierProvider(
                create: (context) => AddressController(
                  addressRepo: locator<AddressRepo>(),
                  onCreatAddressError: (message) => {
                    showCupertinoDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: const Text("Create Address Fail"),
                        content: Text(message.toString()),
                      ),
                    ),
                  },
                  onCreatAddressSuccess: () {
                    print("Create Success");
                    Navigator.pop(context);
                  },
                  onUpdateAddressError: (message) {
                    showCupertinoDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) => AlertDialog.adaptive(
                        title: const Text("Update Address Fail"),
                        content: Text(message.toString()),
                      ),
                    );
                  },
                  onUpdateAddressSuccess: () {
                    print("Update Success");
                    Navigator.pop(context);
                  },
                  addressProvider: context.read<AddressProvider>(),
                ),
                child: Consumer<AddressController>(
                    builder: (context, addressController, child) {
                  return CustomButton(
                    onPressed: addressController.creatAddressLoading
                        ? () {}
                        : () {
                            if (widget.argument.isCreat) {
                              addressController
                                  .onCreatAddress(RequestCreatAddress(
                                name: name.text,
                                phone: phone.text,
                                description: remark.text,
                                address: "HVMX+Q4M, Street 337, Phnom Penh",
                                latitude: "11.584470",
                                longitude: "104.895222",
                              ));
                            } else {
                              addressController.onUpdateAddress(
                                RequestCreatAddress(
                                  name: name.text,
                                  phone: phone.text,
                                  description: remark.text,
                                  address: "HVMX+Q4M, Street 337, Phnom Penh",
                                  latitude: "11.584470",
                                  longitude: "104.895222",
                                ),
                                widget.argument.address!.id!,
                              );
                            }
                          },
                    child: addressController.creatAddressLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Save Location",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
