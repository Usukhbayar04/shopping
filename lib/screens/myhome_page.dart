import 'package:flutter/material.dart';

import 'bag/bag_page.dart';
import 'favorite/favorite_page.dart';
import 'login_signup/login.dart';
import 'main/home_page.dart';
import 'profile/profile_page.dart';
import 'shop/shop_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onScreenTapped(int newIndex) {
    if (_isLoggedIn()) {
      setState(() {
        _currentIndex = newIndex;
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  bool _isLoggedIn() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> body = [
      HomePage(),
      ShopPage(),
      BagPage(),
      FavoritePage(),
      ProfilePage(),
    ];

    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: Center(
        child: body.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: _onScreenTapped,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Shop',
            icon: Icon(Icons.shop),
          ),
          BottomNavigationBarItem(
            label: 'Bag',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.favorite_border),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.people_alt),
          ),
        ],
      ),
    );
  }
}
