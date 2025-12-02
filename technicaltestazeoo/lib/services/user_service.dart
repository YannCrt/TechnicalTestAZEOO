import 'dart:convert';

import 'package:technicaltestazeoo/config/api_config.dart';
import 'package:technicaltestazeoo/models/user.dart';
import 'package:http/http.dart' as http; // pour les requêtes http

class UserService {
  Future<List<User>?> getAllUsers() async {
    var client = http.Client(); // création d'un client http

    var uri = Uri.parse('${ApiConfig.baseUrl}/users'); // construction de l'URI

    var response = await client.get(
      uri,
      headers: {
        "Accept-Language": "fr-FR",
        "X-User-Id": ApiConfig.userId,
        "Authorization": ApiConfig.apiToken,
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(
        response.body,
      ); // conversion du body en json

      List<dynamic> jsonList =
          jsonResponse['items']; // récupération de la liste des utilisateurs, ils sont dans "items"
      // Convertis chaque élément en User
      return jsonList.map((json) => User.fromJson(json)).toList();
    }
    throw Exception('Failed to load users.');
  }
}
