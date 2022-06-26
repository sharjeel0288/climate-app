import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const countriesJsonURL =
    'https://raw.githubusercontent.com/sharjeel0288/city-name-json/main/city.json';

class User {
  final String cityName;
  User({required this.cityName});
  static User fromJson(Map<String, dynamic> json) =>
      User(cityName: json['name']);
}

class UserApi {
  static Future<List<User>> getUserSuggestions(String query) async {
    // final url = Uri.parse(countriesJsonURL);
    // http.Response response = await http.get(url);
    final String response = await rootBundle.loadString('assets/city.json');
    // print(response.body);
    // if (response.statusCode == 200)
    {
      // final List users = jsonDecode(response.body);
      final List users = jsonDecode(response);
      return users.map((json) => User.fromJson(json)).where((user) {
        final nameLower = user.cityName.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
      // } else {
      //   throw Exception();
      // }
    }
  }
}
