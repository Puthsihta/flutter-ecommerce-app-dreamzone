import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/address.dart';
import 'package:dreamzone/data/models/requests/create-address.dart';
import 'package:dreamzone/data/models/respones/list_respone.dart';
import 'package:dreamzone/locator.dart';

abstract class AddressRepo {
  Future<ListRespone<Address>> getAddress();
  Future<bool> creatAddress(RequestCreatAddress request);
  Future<bool> updateAddress(RequestCreatAddress request, int addressId);
  Future<bool> deleteAddress(int addressId);
}

class AddressRepoImpl implements AddressRepo {
  final client = locator<Dio>();

  @override
  Future<ListRespone<Address>> getAddress() async {
    final mappedResponse = (await client.get(
      'address',
    ))
        .data as Map<String, dynamic>;
    final response = ListRespone.fromMap(
      mappedResponse,
      (e) => Address.fromMap(e),
    );

    return response;
  }

  @override
  Future<bool> creatAddress(RequestCreatAddress request) async {
    final apiResponse = (await client.post('address', data: request.toMap()))
        .data as Map<String, dynamic>;
    return apiResponse["message"];
  }

  @override
  Future<bool> updateAddress(RequestCreatAddress request, int addressId) async {
    final apiResponse =
        (await client.put('address/$addressId', data: request.toMap())).data
            as Map<String, dynamic>;
    return apiResponse["message"];
  }

  @override
  Future<bool> deleteAddress(int addressId) async {
    final apiResponse = (await client.delete(
      'address/$addressId',
    ))
        .data as Map<String, dynamic>;
    return apiResponse["message"];
  }
}
