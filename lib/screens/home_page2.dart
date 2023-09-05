import 'package:ecommerce/providers/user_data.dart';
import 'package:ecommerce/screens/cart_screen.dart';

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

import '../widgets/featured_product.dart';

import 'all_product_screen.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  // List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //start header
              SizedBox(
                height: 70,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //header left

                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: const Icon(
                            Icons.person_outlined,
                            size: 28,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 70, height: 15),
                              const Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                UserData().username,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //header right
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const CartScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const SizedBox(
                        height: 50,
                        child: Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //end header
              const SizedBox(height: 10),
              //Start Const Text After header
              const Text(
                "Let's find Your Gadget!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              //End Const Text After header

              const SizedBox(height: 20),

              //Start Offers
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 225, 197, 94),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                height: 160,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Big offers 20%\nSale on products",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          "Looking for the right  \nplace for your money",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AllProductScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            backgroundColor: Colors.black,
                            textStyle: const TextStyle(color: Colors.white),
                          ),
                          child: const Text(
                            'Shop Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/images/PhoneBrand.jpg'),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Featured Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllProductScreen(),
                          ));
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const FeaturedProduct(numOfProduct: 3),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
