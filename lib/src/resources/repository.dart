import 'dart:convert';

import './menu_api_provider.dart';
import './auth_api_provider.dart';
import './db_provider.dart';
import '../models/User.dart';
import '../models/Food_Item.dart';
import '../models/Cart_Item.dart';

class Repository {
  final AuthAPIProvider apiProvider = AuthAPIProvider();
  final MenuAPIProvider menuProvider = MenuAPIProvider();

  Future<int> registerUser(User user) async {
    final httpCode = await apiProvider.registerUser(user);
    return httpCode;
  }

  Future<int> authUser(User user) async {
    await dbProvider.init();
    final response = await apiProvider.authUser(user);

    // If 200, extract email & token, store to db (db provider)
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      user.token = jsonBody['token'];

      await dbProvider.addUser(user);
    }
    await dbProvider.close();
    return response.statusCode;
  }

  Future<User> fetchUser() async {
    await dbProvider.init();
    final user = await dbProvider.fetchUser();
    return user;
  }

  Future<List> fetchMenu() async {
    return menuProvider.fetchMenu();
  }

  Future<List> fetchCart() async {
    await dbProvider.init();
    final cart = await dbProvider.fetchCart();
    return cart.isEmpty ? null : cart;
  }

  Future<void> addToCart(CartItem item) async {
    await dbProvider.init();
    await dbProvider.addCartItem(item);
  }
}
