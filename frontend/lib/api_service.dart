import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String url = 'http://10.0.2.2:8000/api/';

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Data fetched: $data');
      } else {
        print('Failed to fetch data. Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
