import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/providers/products_state_notifier.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/widgets/on_cart_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
    final favStateProvider = StateProvider<bool>((ref) => product.isFav);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          splashColor: Colors.black54,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Visibility(
                          visible: ref.watch(favStateProvider),
                          replacement: OnTabIconButton(
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onIconPressed: () {
                              debugPrint("Add to cart ${product.isFav}");
                              ref
                                  .read(productsStateNotifierProvider.notifier)
                                  .addToFavourite(product);
                              ref.read(favStateProvider.notifier).state = true;
                            },
                          ),
                          child: OnTabIconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onIconPressed: () {
                              ref
                                  .read(productsStateNotifierProvider.notifier)
                                  .removeToFavourite(product);
                              ref.read(favStateProvider.notifier).state = false;
                            },
                          ),
                        ),
                      );
                    },
                  ),

                  // ClipRRect(
                  //   borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  //   child: Image.network(
                  //     '${product.images[0]}',
                  //     fit: BoxFit.fitHeight,
                  //     height: 150,
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                ),
                items: product.images.map(
                  (url) {
                    return Image.network(
                      url,
                      fit: BoxFit.cover,
                    );
                  },
                ).toList(),
              ),
            ),

            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 32, top: 16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 223, 232, 234),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "display",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 23,
                        fontFamily: "display",
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.star_outline),
                        const SizedBox(width: 3),
                        Text(
                          '${product.rating}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Category :',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "display",
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' ${product.category}',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "display",
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "display",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 320,
                      child: Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "display",
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Consumer(
                        builder: (context, ref, child) {
                          return ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(productsStateNotifierProvider.notifier)
                                  .addToCart(product);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CartScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orange,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 8,
                              ),
                            ),
                            child: const Text(
                              "Check Out",
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: "display",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container(
            //   alignment: Alignment.topRight,
            //   child: Column(
            //     children: [
            //       FloatingActionButton(
            //         backgroundColor: Colors.transparent,
            //         elevation: 0,
            //         hoverColor: Colors.transparent,
            //         focusColor: Colors.transparent,
            //         splashColor: Colors.black54,
            //         onPressed: () {},
            //         child: Icon(
            //           Icons.favorite_border_outlined,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
