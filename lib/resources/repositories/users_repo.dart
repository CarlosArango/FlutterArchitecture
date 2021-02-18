import 'package:flutter_fetch/models/user.dart';
import 'package:flutter_fetch/resources/providers/api_jsonplaceholder_user.dart';

class UsersRepo {
  final ApiJsonplaceholderUser _apiJsonplaceholderUser;

  UsersRepo({ApiJsonplaceholderUser apiJsonplaceholderUser})
      : _apiJsonplaceholderUser =
            apiJsonplaceholderUser ?? ApiJsonplaceholderUser();

  Future<List<User>> getUsers() async {
    return await _apiJsonplaceholderUser.getUsers();
  }
}
