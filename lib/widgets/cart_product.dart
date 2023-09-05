import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class CartProduct extends StatelessWidget {
  final Product product;
  final void Function(bool)? onCartTapped;

  const CartProduct({
    super.key,
    required this.product,
    this.onCartTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 70,
            height: 70,
            child: Image.network(
              product.thumbnail,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //name of Brand
              Text(
                product.brand,
                style: const TextStyle(
                  fontFamily: "display",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 200,
                child: Text(
                  product.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: "display",
                    fontSize: 14,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                      fontFamily: "display",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 100),
                  Visibility(
                    visible: product.inCart == false,
                    replacement: InkWell(
                      onTap: () {
                        debugPrint(
                            "press on ${product.isFav} fav ${product.id}");
                        onCartTapped?.call(false);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        onCartTapped?.call(true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
