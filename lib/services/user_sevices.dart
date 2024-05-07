import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping/models/user.dart';

class UserService {
  Future<User> getUser() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/users'));
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
