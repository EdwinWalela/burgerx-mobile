import './menu_api_provider.dart';
import './auth_api_provider.dart';
import './db_provider.dart';
import '../models/User.dart';

class Repository {
  final AuthAPIProvider apiProvider = AuthAPIProvider();

  Future<int> registerUser(User user) async {
    final httpCode = await apiProvider.registerUser(user);
    return httpCode;
  }

  Future<int> authUser(User user) async {
    final response = await apiProvider.authUser(user);

    // If 200, extract email & token, store to db (db provider)
    return response.statusCode;
  }
}
