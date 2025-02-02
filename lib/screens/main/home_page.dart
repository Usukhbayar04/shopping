import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/main/productCard.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<ProductModel>> _getData() async {
    String result = await DefaultAssetBundle.of(context)
        .loadString("assets/data/products.json");
    return ProductModel.fromList(jsonDecode(result));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width;
    // List<List<ProductModel>> selectedCate = [
    //   'Men\'s Clothing',
    //   'Jewelry',
    //   'Electronics',
    //   'Women\'s Clothing',
    // ];

    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 270,
                      width: height,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img4.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment(-0.8, 0.8),
                        child: Text(
                          'Fashion killa',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color.fromARGB(255, 8, 182, 124),
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  'New summer style',
                                  style: TextStyle(
                                    color: const Color.fromARGB(135, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Text('View all'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 230,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: List.generate(
                                  min(snapshot.data!.length, 6),
                                  (index) =>
                                      ProductCard(data: snapshot.data![index]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New style',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 32,
                                  ),
                                ),
                                Text(
                                  'New summer style',
                                  style: TextStyle(
                                    color: const Color.fromARGB(135, 0, 0, 0),
                                  ),
                                ),
                              ],
                            ),
                            Text('View all'),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 250,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: List.generate(
                                    min(snapshot.data!.length, 4),
                                    (index) => ProductCard(
                                        data: snapshot.data![index]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error fetching data'),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
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
