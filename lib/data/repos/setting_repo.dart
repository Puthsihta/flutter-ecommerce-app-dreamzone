import 'package:dio/dio.dart';
import 'package:dreamzone/data/models/contact.dart';
import 'package:dreamzone/data/models/respones/base_response.dart';
import 'package:dreamzone/data/models/setting.dart';
import 'package:dreamzone/locator.dart';

abstract class SettingRepo {
  Future<Setting> getSetting(String type);
  Future<Contact> getContactUs();
}

class SettingRepoImpl extends SettingRepo {
  final request = locator<Dio>();
  @override
  Future<Setting> getSetting(String type) async {
    final apiResponse = (await request.get(
      'setting?type=$type',
    ))
        .data as Map<String, dynamic>;

    final response =
        BaseResponse.fromMap(apiResponse, Setting.fromMap(apiResponse["data"]));
    return response.data;
  }

  @override
  Future<Contact> getContactUs() async {
    final apiResponse = (await request.get(
      'setting?type=contact_us',
    ))
        .data as Map<String, dynamic>;

    final response =
        BaseResponse.fromMap(apiResponse, Contact.fromMap(apiResponse["data"]));
    return response.data;
  }
}
