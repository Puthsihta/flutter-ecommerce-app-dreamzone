import 'package:dreamzone/constants/argument.dart';
import 'package:dreamzone/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdateLocationScreen extends StatefulWidget {
  static const routeName = "/address/change-location";
  final UpdateLocationArgument argument;
  const UpdateLocationScreen({super.key, required this.argument});

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      appBar: AppBar(
        backgroundColor: baseColor,
        titleSpacing: 0,
        title: Row(
          children: [
            Flexible(
              child: TextField(
                controller: searchController,
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
                        // setState(() {
                        //   // showSearchBar = false;
                        // });
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
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Set your initial location
          zoom: 10,
        ),
        // myLocationEnabled: false,
        // myLocationButtonEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          // You can perform additional map setup here if needed
        },
      ),
    );
  }
}
