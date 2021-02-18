import 'dart:convert';

import 'package:flutter_fetch/models/user.dart';
import 'package:http/http.dart' as http;

class ApiJsonplaceholderUser {
  final API_URL_BASE = "https://jsonplaceholder.typicode.com";

  Future<List<User>> getUsers() async {
    final endpoint = "users";
    http.Response response = await http.get("$API_URL_BASE/$endpoint");
    if (response.statusCode != 200) {
      throw Exception("Ha ocurrido un error consultado el API");
    }

    final body = json.decode(response.body);

    return List<User>.from(
      body.map(
        (user) {
          return User.fromJson(user);
        },
      ),
    );
  }
}
