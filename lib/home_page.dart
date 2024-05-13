import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shopping/Provider/auth_provider.dart';
// import 'package:shopping/models/user.dart';
import 'package:shopping/screens/bag/bag_page.dart';
import 'package:shopping/screens/favorite/favorite_page.dart';
import 'package:shopping/screens/profile/profile_page.dart';
import 'package:shopping/screens/shop/shop_page.dart';
import 'screens/main/my_home_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  // User? currentUser;

  // void initState() {
  //   super.initState();
  //   currentUser = Provider.of<AuthProvider>(context, listen: false).currentUser;
  // }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MyHomePage(),
      ShopPage(),
      BagPage(),
      FavoritePage(),
      ProfilePage(user: null), // if (currentUser != null) ProfilePage(),
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
