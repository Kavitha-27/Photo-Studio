import 'dart:convert';
import 'package:http/http.dart' as http;
import 'profile_page.dart';

Future<ShopProfile> fetchShopProfile() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return ShopProfile.fromJson(data);
  } else {
    throw Exception('Failed to load profile');
  }
}
