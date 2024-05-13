import 'package:flutter/material.dart';
import 'package:shopping/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<User> getUser() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/users/1'));

    if (response.statusCode == 200) {
      final userData = json.decode(response.body);
      return User.fromJson(userData);
    } else {
      throw Exception('Failed to load user');
    }
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<User> _userFuture;
  final _userService = UserService();

  @override
  void initState() {
    super.initState();
    _userFuture = _userService.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final user = snapshot.data!;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${user.firstname} ${user.lastname}'),
                Text('Email: ${user.email}'),
                Text('Phone: ${user.phone}'),
                // You can display other user information here
              ],
            ),
          );
        }
      },
    );
  }
}
