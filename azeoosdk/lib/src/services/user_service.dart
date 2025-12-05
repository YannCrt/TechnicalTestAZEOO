import 'dart:convert';
import 'package:http/http.dart' as http;
import '../sdk.dart';
import '../models/user.dart';

class UserService {
  Future<List<User>?> getAllUsers() async {
    var client = http.Client();
    var uri = Uri.parse('${MySDK.config.baseUrl}/users');

    var response = await client.get(
      uri,
      headers: {
        "Accept-Language": "fr-FR",
        "X-User-Id": "1",
        "Authorization": MySDK.config.token,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<dynamic> jsonList = jsonResponse['items'];
      return jsonList.map((json) => User.fromJson(json)).toList();
    }
    throw Exception('Failed to load users.');
  }

  Future<User> getUserById(int id) async {
    var client = http.Client();
    var uri = Uri.parse('${MySDK.config.baseUrl}/users/$id');

    var response = await client.get(
      uri,
      headers: {
        "Accept-Language": "fr-FR",
        "X-User-Id": "$id",
        "Authorization": MySDK.config.token,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return User.fromJson(jsonResponse);
    }
    throw Exception('Failed to load users.');
  }
}
