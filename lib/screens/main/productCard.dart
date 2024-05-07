import 'package:flutter/material.dart';
import 'package:shopping/Provider/favorite_provider.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/detail/detail_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel data;
  const ProductCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String shortenText(String text, int maxLength) {
      if (text.length <= maxLength) {
        return text;
      } else {
        return text.substring(0, maxLength) + '...';
      }
    }

    final providerFavo = FavoriteProvider.of(context);
    // double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(data: data)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 5),
        child: Container(
          width: 180,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 130,
                      width: 800,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data.image!),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    if (data.rating != null) ...[
                      Row(
                        children: [
                          // Display star icons based on the rating rate
                          for (int i = 0; i < 5; i++)
                            if (i < data.rating!.rate!.floor())
                              Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 255, 230, 0),
                                size: 18,
                              )
                            else if (i < data.rating!.rate!)
                              Icon(
                                Icons.star_half,
                                color: Color.fromARGB(255, 255, 230, 0),
                                size: 18,
                              )
                            else
                              Icon(
                                Icons.star_border,
                                color: Color.fromARGB(255, 255, 230, 0),
                                size: 18,
                              ),
                          SizedBox(width: 5),
                          Text('${data.rating!.rate} (5)'),
                        ],
                      ),
                    ],
                  ],
                ),
                Text(
                  shortenText(data.title!, 10),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.price!.toString(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          providerFavo.toggleFavorite(data);
                        },
                        child: Icon(
                          providerFavo.isExist(data)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
