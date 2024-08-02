// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:dreamzone/data/models/requests/create-address.dart';
import 'package:dreamzone/data/repos/address_repo.dart';
import 'package:dreamzone/providers/address_provider.dart';

class AddressController extends ChangeNotifier {
  final AddressRepo addressRepo;
  late AddressProvider addressProvider;

  Function()? onCreatAddressSuccess;
  Function(dynamic message)? onCreatAddressError;

  Function()? onUpdateAddressSuccess;
  Function(dynamic message)? onUpdateAddressError;

  Function()? onDeleteAddressSuccess;
  Function(dynamic message)? onDeleteAddressError;

  AddressController({
    required this.addressRepo,
    required this.addressProvider,
    this.onCreatAddressSuccess,
    this.onCreatAddressError,
    this.onUpdateAddressSuccess,
    this.onUpdateAddressError,
    this.onDeleteAddressSuccess,
    this.onDeleteAddressError,
  });

  bool creatAddressLoading = false;
  bool deleteAddressLoading = false;

  Future<void> onCreatAddress(RequestCreatAddress data) async {
    creatAddressLoading = true;
    try {
      final response = await addressRepo.creatAddress(data);
      if (response) {
        if (onCreatAddressSuccess != null) {
          onCreatAddressSuccess!();
          addressProvider.getAddress();
        }
      }
    } catch (e) {
      var message = e.toString();
      if (e is DioException) {
        if (e.message != null) {
          message = e.message!;
        }
      }
      print('message : $message, ');
      onCreatAddressError!(message);
    } finally {
      creatAddressLoading = false;
    }
  }

  Future<void> onUpdateAddress(RequestCreatAddress data, int addressId) async {
    creatAddressLoading = true;
    try {
      final response = await addressRepo.updateAddress(data, addressId);
      if (response) {
        if (onUpdateAddressSuccess != null) {
          onUpdateAddressSuccess!();
          addressProvider.getAddress();
        }
      }
    } catch (e) {
      var message = e.toString();
      if (e is DioException) {
        if (e.message != null) {
          message = e.message!;
        }
      }
      print('message : $message, ');
      onUpdateAddressError!(message);
    } finally {
      creatAddressLoading = false;
      notifyListeners();
    }
  }

  Future<void> onDeleteAddress(int addressId) async {
    try {
      final response = await addressRepo.deleteAddress(addressId);
      if (response) {
        addressProvider.getAddress();
      }
    } catch (e) {
      var message = e.toString();
      if (e is DioException) {
        if (e.message != null) {
          message = e.message!;
        }
      }
      print('message : $message, ');
    } finally {}
  }
}
