import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/login_signup/login.dart';

import '../../Provider/auth_provider.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
              child: Text(authProvider.isLoggedIn ? 'Logout' : 'login'),
            ),
          ],
        ),
      ),
    );
  }
}
