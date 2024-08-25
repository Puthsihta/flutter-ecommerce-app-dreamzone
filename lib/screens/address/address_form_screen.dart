import 'dart:async';

import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/requests/create_address.dart';
import 'package:dreamzone/data/repos/address_repo.dart';
import 'package:dreamzone/l10n/l10n.dart';
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
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  late FocusNode refName;
  late FocusNode refPhone;
  AddressMap selectAddress = AddressMap(
    address: '',
    latitude: 11.5564,
    longitude: 104.9282,
  );
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    refName = FocusNode();
    refPhone = FocusNode();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (widget.argument.isCreat) {
      phone = TextEditingController(text: userProvider.user!.phone);
      _getCurrentLocation();
    } else {
      name = TextEditingController(text: widget.argument.address!.name);
      phone = TextEditingController(text: widget.argument.address!.phone);
      remark =
          TextEditingController(text: widget.argument.address!.description);
      selectAddress = AddressMap(
        address: widget.argument.address!.address ?? '',
        latitude: double.parse(widget.argument.address!.latitude ?? '11.5564'),
        longitude:
            double.parse(widget.argument.address!.longitude ?? '104.9282'),
      );
    }
  }

  @override
  void dispose() {
    refName.dispose();
    refPhone.dispose();
    name.dispose();
    phone.dispose();
    remark.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) return;

    final GoogleMapController controller = await mapController.future;
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Get the address
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];

    final addressName =
        "${place.name}, ${place.street}, ${place.locality}, ${place.country}";

    controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        14.0,
      ),
    );
    setState(() {
      selectAddress = AddressMap(
        address: addressName,
        latitude: position.latitude,
        longitude: position.longitude,
      );
    });
  }

  Future<bool> _handlePermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        title: Text(
          widget.argument.isCreat ? l10n!.create_address : l10n!.update_address,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ChangeNotifierProvider(
          create: (centext) => AddressController(
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
              Navigator.pop(context);
            },
            addressProvider: context.read<AddressProvider>(),
          ),
          child: Consumer<AddressController>(
              builder: (context, addressController, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          color: Colors.white,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GoogleMap(
                              initialCameraPosition: CameraPosition(
                                target: LatLng(
                                  selectAddress.latitude,
                                  selectAddress.longitude,
                                ), // Set your initial location
                                zoom: 14,
                              ),
                              markers: Set<Marker>.of({
                                Marker(
                                  markerId: MarkerId(
                                    selectAddress.latitude.toString(),
                                  ),
                                  position: LatLng(
                                    selectAddress.latitude,
                                    selectAddress.longitude,
                                  ),
                                  infoWindow: const InfoWindow(
                                    title: 'Your Location',
                                  ),
                                ),
                              }),
                              onTap: (argument) async {
                                final callBack =
                                    await Navigator.of(context).pushNamed(
                                  UpdateLocationScreen.routeName,
                                  arguments: UpdateLocationArgument(
                                    address: AddressMap(
                                      address: selectAddress.address,
                                      latitude: selectAddress.latitude,
                                      longitude: selectAddress.longitude,
                                    ),
                                  ),
                                );
                                final AddressMap pickUpAddress =
                                    callBack as AddressMap;
                                setState(() {
                                  selectAddress = pickUpAddress;
                                });
                                final GoogleMapController controller =
                                    await mapController.future;
                                controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(
                                    LatLng(
                                      pickUpAddress.latitude,
                                      pickUpAddress.longitude,
                                    ),
                                    14.0,
                                  ),
                                );
                              },
                              scrollGesturesEnabled: false,
                              zoomGesturesEnabled: false,
                              compassEnabled: false,
                              myLocationEnabled: false,
                              myLocationButtonEnabled: false,
                              onMapCreated: (GoogleMapController controller) {
                                mapController.complete(controller);
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            selectAddress.address != ""
                                ? selectAddress.address
                                : l10n.your_location,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: titleColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CustomTextInput(
                          label: l10n.name,
                          hintText: l10n.enter_name,
                          controller: name,
                          prefixIcon: Icon(
                            Icons.person,
                            color: placeHolderColor,
                          ),
                          focusNode: refName,
                          enable: true,
                          keyboardType: TextInputType.name,
                          onSubmitAction: (value) {
                            refName.unfocus();
                            FocusScope.of(context).requestFocus(refPhone);
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextInput(
                          label: l10n.phone,
                          hintText: l10n.enter_phone,
                          controller: phone,
                          focusNode: refPhone,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: placeHolderColor,
                          ),
                          enable: true,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 15),
                        CustomTextInput(
                          label: l10n.remark,
                          hintText: l10n.enter_remark,
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
                  child: CustomButton(
                    onPressed: addressController.creatAddressLoading
                        ? () {}
                        : () {
                            if (name.text.isEmpty) {
                              FocusScope.of(context).requestFocus(refName);
                              return;
                            }
                            if (phone.text.isEmpty) {
                              FocusScope.of(context).requestFocus(refPhone);
                              return;
                            }
                            if (widget.argument.isCreat) {
                              addressController
                                  .onCreatAddress(RequestCreatAddress(
                                name: name.text,
                                phone: phone.text,
                                description: remark.text,
                                address: selectAddress.address,
                                latitude: selectAddress.latitude.toString(),
                                longitude: selectAddress.longitude.toString(),
                              ));
                            } else {
                              addressController.onUpdateAddress(
                                RequestCreatAddress(
                                  name: name.text,
                                  phone: phone.text,
                                  description: remark.text,
                                  address: selectAddress.address,
                                  latitude: selectAddress.latitude.toString(),
                                  longitude: selectAddress.longitude.toString(),
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
                        : Text(
                            l10n.save_location,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
