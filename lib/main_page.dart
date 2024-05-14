import 'package:flutter/material.dart';
import 'package:shopping/screens/bag/bag_page.dart';
import 'package:shopping/screens/favorite/favorite_page.dart';
import 'package:shopping/screens/home/home_page.dart';
import 'package:shopping/screens/profile/profile_page.dart';
import 'package:shopping/screens/shop/shop_page.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomePage(),
      ShopPage(),
      BagPage(),
      FavoritePage(),
      ProfilePage(),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                size: 26,
                color: currentIndex == 0 ? Colors.black : Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 26,
                color: currentIndex == 1 ? Colors.black : Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.badge_rounded,
                size: 26,
                color: currentIndex == 2 ? Colors.black : Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                size: 26,
                color: currentIndex == 3 ? Colors.black : Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                size: 26,
                color: currentIndex == 4 ? Colors.black : Colors.black45,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
