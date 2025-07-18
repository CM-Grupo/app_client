import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/menu_model.dart';

class MenuApiDatasource {
  static const String _baseUrl = 'https://api.sebastian.cl/restaurant';

  Future<List<MenuModel>> getTodayMenu() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString('jwt');

    print('JWT Token: $jwt'); // Debug print

    final url = Uri.parse('$_baseUrl/v1/menu/today');
    print('Llamando a: $url'); // Debug print

    final response = await http.get(
      url,
      headers: {'accept': 'application/json', 'Authorization': 'Bearer $jwt'},
    );

    print('Status Code: ${response.statusCode}'); // Debug print
    print('Response Body: ${response.body}'); // Debug print

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => MenuModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar el menú: ${response.statusCode}');
    }
  }
}
