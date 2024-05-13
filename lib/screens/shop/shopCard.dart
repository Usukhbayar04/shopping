import 'package:flutter/material.dart';
import 'package:shopping/models/products.dart';
import 'package:shopping/screens/detail/detail_page.dart';

class ShopCard extends StatelessWidget {
  final ProductModel data;
  const ShopCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String shortenText(String text, int maxLength) {
      if (text.length <= maxLength) {
        return text;
      } else {
        return text.substring(0, maxLength) + '...';
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(data: data)),
        );
      },
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 200,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(data.image!),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shortenText(data.title!, 10),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    shortenText(data.description!, 20),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                            Text(
                              '${data.rating!.rate} (5)',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "\$${data.price!.toString()}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
