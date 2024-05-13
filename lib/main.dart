import 'package:flutter/material.dart';
import 'package:shopping/Provider/auth_provider.dart';
import 'package:shopping/Provider/card_provider.dart';
import 'package:shopping/Provider/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:shopping/home_page.dart';

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
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 231, 227, 227),
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: Color.fromARGB(255, 233, 227, 227),
          ),
          home: HomePage(),
        ),
      );
}
