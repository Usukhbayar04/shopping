import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/screens/shop/shopCard.dart';

import '../../models/products.dart';
// import 'package:shopping/widgets/shopCard.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Future<List<ProductModel>> _getData() async {
    String result = await DefaultAssetBundle.of(context)
        .loadString("assets/data/products.json");
    return ProductModel.fromList(jsonDecode(result));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.all(15),
            child: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    Flexible(
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(3),
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 10,
                              children: List.generate(
                                min(snapshot.data!.length, 6),
                                (index) =>
                                    ShopCard(data: snapshot.data![index]),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (ConnectionState.waiting == snapshot.connectionState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching data'),
          );
        } else {
          return Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
