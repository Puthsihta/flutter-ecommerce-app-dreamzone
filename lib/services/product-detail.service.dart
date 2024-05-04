import 'dart:convert';
import 'package:dreamzone/models/product-detail.model.dart';
import 'package:http/http.dart' as http;

class ProductDetailService {
  Future<ProductDetail> getProductDetail(int id) async {
    // const url = "https://dreamzone.phsartech.com/api/home";
    final uri = Uri.parse("https://www.dreamzonekh.com/api/product-detail/$id");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // print(json);
      final data = ProductDetail.fromJson(json);
      return data;
      // return json;
    }
    throw "Something went wrong";
  }
}
