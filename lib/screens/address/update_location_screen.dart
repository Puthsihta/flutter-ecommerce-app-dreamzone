import 'dart:async';
import 'dart:convert';

import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/data/models/requests/create_address.dart';
import 'package:dreamzone/l10n/l10n.dart';
import 'package:dreamzone/screens/address/update_location_controller.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:dreamzone/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class UpdateLocationScreen extends StatefulWidget {
  static const routeName = "/address/change-location";
  final UpdateLocationArgument argument;
  const UpdateLocationScreen({super.key, required this.argument});

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  final searchController = TextEditingController();
  late SearchLocationController searchLocationController;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  late AddressMap selectAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void moveToLocation(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${dotenv.env['GOOGLE_MAPS_API_KEY']}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final location = jsonResponse['result']['geometry']['location'];
      final latLng = LatLng(location['lat'], location['lng']);

      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(latLng, 14.0),
      );
      selectAddress = AddressMap(
        address: jsonResponse['result']['formatted_address'],
        latitude: location['lat'],
        longitude: location['lng'],
      );
    }
  }

  Future<void> _getCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;

    if (widget.argument.address!.address.isNotEmpty) {
      controller.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            widget.argument.address!.latitude,
            widget.argument.address!.longitude,
          ),
          14.0,
        ),
      );
      selectAddress = AddressMap(
        address: widget.argument.address!.address,
        latitude: widget.argument.address!.latitude,
        longitude: widget.argument.address!.longitude,
      );
      return;
    }
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
    selectAddress = AddressMap(
      address: addressName,
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  void onCameraMove(CameraPosition position) async {
    selectAddress = AddressMap(
      address: "",
      latitude: position.target.latitude,
      longitude: position.target.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ChangeNotifierProvider(
      create: (context) => SearchLocationController(),
      child: Scaffold(
        backgroundColor: whiteSmoke,
        appBar: AppBar(
          backgroundColor: baseColor,
          titleSpacing: 0,
          title: Row(
            children: [
              Flexible(
                child: Consumer<SearchLocationController>(
                    builder: (context, searchProvider, child) {
                  return TextField(
                    controller: searchController,
                    onChanged: (value) {
                      searchProvider.searchLocations(value);
                    },
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
                          searchController.clear();
                          searchProvider.searchLocations('');
                        },
                        child: Visibility(
                          visible: true,
                          child: Icon(
                            Icons.cancel,
                            color: placeHolderColor,
                          ),
                        ),
                      ),
                      hintText: l10n!.search_placeholder,
                      filled: true,
                      fillColor: Colors.white,
                      border: const OutlineInputBorder(),
                    ),
                  );
                }),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(
                        11.5564,
                        104.9282,
                      ), // Set your initial location
                      zoom: 14.0,
                    ),
                    myLocationButtonEnabled: false,
                    onMapCreated: (GoogleMapController controller) {
                      mapController.complete(controller);
                    },
                    zoomGesturesEnabled: false,
                    onCameraMove: onCameraMove,
                    // markers: Set<Marker>.of(_markers),
                  ),
                  Center(
                      child: Transform(
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  )),
                  Positioned(
                    bottom: 15 + MediaQuery.of(context).padding.bottom / 2,
                    right: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _getCurrentLocation();
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45 / 2),
                            ),
                            child: const Icon(Icons.location_searching),
                          ),
                        ),
                        CustomButton(
                          onPressed: () async {
                            // Get the address
                            String addressName = selectAddress.address;
                            if (addressName.isEmpty) {
                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                selectAddress.latitude,
                                selectAddress.longitude,
                              );
                              Placemark place = placemarks[0];

                              addressName =
                                  "${place.name}, ${place.street}, ${place.locality}, ${place.country}";
                            }
                            Navigator.pop(
                              context,
                              AddressMap(
                                address: addressName,
                                latitude: selectAddress.latitude,
                                longitude: selectAddress.longitude,
                              ),
                            );
                          },
                          child: Text(
                            l10n!.update_location,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<SearchLocationController>(
                    builder: (context, searchProvider, child) {
                      searchLocationController = searchProvider;
                      return searchProvider.searchResults.isNotEmpty
                          ? Container(
                              color: Colors.white,
                              height: 200,
                              child: ListView.builder(
                                itemCount: searchProvider.searchResults.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      searchProvider.searchResults[index]
                                          ['description'],
                                    ),
                                    onTap: () {
                                      moveToLocation(searchProvider
                                          .searchResults[index]['place_id']);
                                    },
                                  );
                                },
                              ),
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
