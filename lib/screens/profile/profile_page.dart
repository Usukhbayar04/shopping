import 'package:flutter/material.dart';
import 'package:shopping/models/user.dart';
import 'package:shopping/services/user_sevices.dart';
import 'package:shopping/screens/profile/settingsCard.dart';

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
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/main.jpg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40),
                SettingsCard(setTitle: 'My orders'),
                SizedBox(height: 30),
                SettingsCard(setTitle: 'Shipping addresses'),
                SizedBox(height: 30),
                SettingsCard(setTitle: 'Payment methods'),
                SizedBox(height: 30),
                SettingsCard(setTitle: 'Promotion codes'),
                SizedBox(height: 30),
                SettingsCard(setTitle: 'Settings'),
              ],
            ),
          );
        }
      },
    );
  }
}
