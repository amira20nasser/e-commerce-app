import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        width: screenWidth / 2.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          // alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.fitHeight,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.star_outline),
                      Text(
                        '4.6',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topRight,
              child: Column(children: [
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.black54,
                  onPressed: () {},
                  child: const Icon(Icons.favorite_border_outlined,
                      color: Colors.black),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 240,
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.black54,
                  onPressed: () {},
                  child: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
