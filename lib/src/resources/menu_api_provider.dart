import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/Food_Item.dart';

class MenuAPIProvider {
  Client client = Client();
  String _baseURL = 'https://burgerx.herokuapp.com/api/';

  Future<List<FoodItem>> fetchMenu() async {
    var url = Uri.parse('$_baseURL/menu');

    final response = await client.get(url);
    final menu = List.from(json.decode(response.body));

    return menu.cast<FoodItem>();
  }

  Future<List<FoodItem>> fetchMenuCategory(String category) async {
    var url = Uri.parse('$_baseURL/menu/$category');

    final response = await client.get(url);

    final menu = List.from(json.decode(response.body));

    return menu.cast<FoodItem>();
  }
}
