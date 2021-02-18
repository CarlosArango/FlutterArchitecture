import 'dart:convert';

import 'package:flutter_fetch/models/user.dart';
import 'package:http/http.dart' as http;

class ApiJsonplaceholderUser {
  final http.Client _clienthttp;
  final API_URL_BASE = "https://jsonplaceholder.typicode.com";

  ApiJsonplaceholderUser({http.Client clienthttp})
      : _clienthttp = clienthttp ?? http.Client();

  Future<List<User>> getUsers() async {
    final endpoint = "users";
    http.Response response = await _clienthttp.get("$API_URL_BASE/$endpoint");
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
