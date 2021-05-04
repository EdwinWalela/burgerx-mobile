import './menu_api_provider.dart';
import './auth_api_provider.dart';
import '../models/User.dart';

class Repository {
  final AuthAPIProvider apiProvider = AuthAPIProvider();

  Future<int> registerUser(User user) async {
    final httpCode = await apiProvider.registerUser(user);
    return httpCode;
  }
}
