import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shopping/models/user.dart';

import '../screens/profile/profile_page.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Future<User?> login(
      BuildContext context, String email, String password) async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/users'),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      for (var user in data) {
        if (user['email'] == email && user['password'] == password) {
          print('User authenticated');
          _isLoggedIn = true;
          notifyListeners();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProfilePage(),
            ),
          );
        }
      }
    } else {
      print('Failed to authenticate. Server error.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('user not found'),
          duration: Duration(seconds: 2),
        ),
      );
    }
    return null;
  }
  //john@gmail.com
  //m38rmF$

  User? _currentUser;

  User? get currentUser => _currentUser;
}
