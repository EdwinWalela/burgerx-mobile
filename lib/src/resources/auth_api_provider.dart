import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/User.dart';

class AuthAPIProvider {
  Client client = Client();
  String _baseURL = 'https://burgerx.herokuapp.com/api/auth';

  Future<int> registerUser(User user) async {
    var url = Uri.parse('$_baseURL/register');

    final response = await client.post(
      url,
      body: {
        'email': user.email,
        'password': user.password,
        'username': user.username,
      },
    );

    return response.statusCode;
  }

  Future<int> authUser(User user) async {
    var url = Uri.parse('$_baseURL/login');

    final response = await client.post(
      url,
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    // if 200 store user+token in local db
    print(response.body);
    return response.statusCode;
  }
}
