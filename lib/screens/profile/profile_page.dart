import 'package:flutter/material.dart';
import 'package:shopping/models/user.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  final User? user;
  ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.user!.username}'),
            Text('password: ${widget.user?.password}'),
          ],
        ),
      ),
    );
  }
}
