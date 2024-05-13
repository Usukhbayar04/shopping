import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Provider/card_provider.dart';
import 'package:shopping/Provider/favorite_provider.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/login_signup/login.dart';

import '../../Provider/auth_provider.dart';

class DetailPage extends StatefulWidget {
  final ProductModel data;
  const DetailPage({
    super.key,
    required this.data,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final providerFavo = FavoriteProvider.of(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (currentIndex != 1) {
                          setState(() {
                            currentIndex--;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      currentIndex.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (authProvider.isLoggedIn) {
                    providerFavo.toggleFavorite(widget.data);
                    provider.toggleFavorite(widget.data);
                    const snackBar = SnackBar(
                      content: Text(
                        'Succesfully added!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(
                        seconds: 1,
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print('nevtersen bn');
                  } else {
                    print('not logged in.');
                    Navigator.push(
                      (context),
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Spacer(),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      if (authProvider.isLoggedIn) {
                        providerFavo.toggleFavorite(widget.data);
                      } else {
                        Navigator.push((context),
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      }
                    },
                    icon: Icon(
                      providerFavo.isExist(widget.data)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 250,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.data.image!),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.data.title!,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "\$${widget.data.price}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.amber,
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 14,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        widget.data.rating!.rate.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Description",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          widget.data.description!,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
