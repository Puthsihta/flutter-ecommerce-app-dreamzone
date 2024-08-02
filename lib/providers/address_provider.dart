import 'package:dreamzone/constants/analytics.dart';
import 'package:dreamzone/constants/storage_key.dart';
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/data/repos/address_repo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressProvider with ChangeNotifier {
  final AddressRepo addressRepo;

  AddressProvider({
    required this.addressRepo,
  });

  bool _loading = true;
  Address _seleteAddress = Address(
    id: 0,
    name: "Current Location",
    phone: null,
    description: null,
    address: "Russian Federation Blvd (110), Phnom Penh 120404",
    latitude: "11.568121",
    longitude: "104.889500",
  );
  List<Address> _address = [];
  List<Address> get address => _address;
  set address(List<Address> data) {
    _address = data;
    notifyListeners();
  }

  CustomException? _error;
  CustomException? get error => _error;
  set error(CustomException? newValue) {
    _error = newValue;
    notifyListeners();
  }

  bool get loading => _loading;
  set loading(bool newValue) {
    _loading = newValue;
    notifyListeners();
  }

  Address get selectAddress => _seleteAddress;
  set selectAddress(Address data) {
    _seleteAddress = data;
    notifyListeners();
  }

  Future<void> getAddress() async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      final respone = await addressRepo.getAddress();
      address = respone.data;
    } catch (e) {
      _error = CustomException(e.toString());
      notifyListeners();
    } finally {
      loading = false;
    }
  }

  Future<void> getSelectAddress() async {
    await Future.delayed(const Duration(milliseconds: 300));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final addressString = prefs.getString(StorageKeys.ADDRESS);
    try {
      if (addressString != null) {
        final cartRespone = Address.fromJson(addressString);
        selectAddress = cartRespone;
      }
    } catch (e) {
      print("\n\nerror get address: ${e}");
    }
  }

  Future<void> setSelectedAddress(Address address) async {
    final prefs = await SharedPreferences.getInstance();
    selectAddress = address;
    prefs.setString(StorageKeys.ADDRESS, address.toJson());
  }

  Future<void> ensureInitialization() async {
    try {
      getAddress();
      getSelectAddress();
    } catch (e) {
      selectAddress = Address(
        id: 0,
        name: "Current Location",
        phone: null,
        description: null,
        address: "Russian Federation Blvd (110), Phnom Penh 120404",
        latitude: "11.568121",
        longitude: "104.889500",
      );
    }
  }
}
