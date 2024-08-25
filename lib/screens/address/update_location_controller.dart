import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class SearchLocationController with ChangeNotifier {
  final String _apiKey = dotenv.env['GOOGLE_MAPS_API_KEY']!;
  List<dynamic> _searchResults = [];

  List<dynamic> get searchResults => _searchResults;

  Future<void> searchLocations(String query) async {
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    final url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json'
        '?input=$query&key=$_apiKey&types=geocode&region=kh&fields=formatted_address,name,rating,opening_hours,geometry';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      _searchResults = jsonResponse['predictions'];
    } else {
      _searchResults = [];
    }

    notifyListeners();
  }
}
