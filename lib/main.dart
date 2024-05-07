import 'package:flutter/material.dart';
import 'package:shopping/Provider/card_provider.dart';
import 'package:shopping/Provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:shopping/screens/main/home_page.dart';

// import 'screens/myhome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 0, 0, 0)),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color.fromARGB(228, 255, 255, 255),
          ),
          home: HomePage(),
        ),
      );
}
// morrison@gmail.com