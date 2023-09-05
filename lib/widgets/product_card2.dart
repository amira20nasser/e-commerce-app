import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/screens/product_details.dart';
import 'package:flutter/material.dart';

import 'on_cart_icon_button.dart';

class ProductCard2 extends StatelessWidget {
  final Product product;
  final void Function(bool)? onFavTapped;
  final void Function(bool)? onCartTapped;

  const ProductCard2({
    Key? key,
    required this.product,
    this.onFavTapped,
    this.onCartTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 300,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetails(
                product: product,
              ),
            ),
          );
        },
        child: Container(
          width: screenWidth / 2.4,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.fitHeight,
                      height: 120,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: product.isFav == true,
                      replacement: InkWell(
                        onTap: () {
                          debugPrint(
                              "press on ${product.isFav} fav ${product.id}");
                          onFavTapped?.call(false);
                        },
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          debugPrint(
                              "press on ${product.isFav} fav ${product.id}");
                          onFavTapped?.call(true);
                        },
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: Text(
                  product.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star_outline),
                          Text(
                            '${product.rating}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Visibility(
                    visible: product.inCart == false,
                    replacement: OnTabIconButton(
                      onIconPressed: () {
                        onCartTapped?.call(false);
                      },
                      icon: const Icon(
                        Icons.remove,
                      ),
                    ),
                    child: OnTabIconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                      ),
                      onIconPressed: () {
                        onCartTapped?.call(true);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
