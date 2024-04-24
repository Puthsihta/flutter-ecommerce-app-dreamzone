import 'dart:convert';
import 'package:dreamzone/models/home.model.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future<Home> getHome() async {
    // const url = "https://dreamzone.phsartech.com/api/home";
    const url = "https://www.dreamzonekh.com/api/home";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = Home.fromJson(json);
      return data;
    }
    throw "Something went wrong";
  }
}
