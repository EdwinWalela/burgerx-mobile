import 'dart:convert';
import './menu_api_provider.dart';
import './auth_api_provider.dart';
import './db_provider.dart';
import '../models/User.dart';

class Repository {
  final AuthAPIProvider apiProvider = AuthAPIProvider();
  final DbProvider dbProvider = DbProvider();

  Future<int> registerUser(User user) async {
    final httpCode = await apiProvider.registerUser(user);
    return httpCode;
  }

  Future<int> authUser(User user) async {
    final response = await apiProvider.authUser(user);

    // If 200, extract email & token, store to db (db provider)
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      user.token = jsonBody['token'];

      await dbProvider.addUser(user);
    }

    return response.statusCode;
  }
}
