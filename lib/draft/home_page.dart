import 'package:ecommerce/widgets/category_item.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                  Radius.circular(20.0))),
                          child: const Icon(
                            Icons.person_outlined,
                            size: 28,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(width: 70, height: 15),
                              Text(
                                "Hello",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Anton Abdalla",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    //header right
                    ElevatedButton(
                      onPressed: () {},
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
                            Icons.shopping_bag_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ]),
            ),
            //end header
            const SizedBox(height: 10),
            //Start Const Text After header
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Let's find",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Your Gadget!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            //End Const Text After header
            const SizedBox(
              height: 20,
            ),
            //Start Search Field
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.black)),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
            //End Search Field
            const SizedBox(
              height: 20,
            ),

            //Start Offers
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 225, 197, 94),
              ),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 140,
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
                        onPressed: () {},
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
            //End Offers
            const SizedBox(
              height: 20,
            ),
            //Start Category
            const Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "View All",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [CategoryItem(type: 'smart phone')],
              ),
            ]),
            //End Category
            const SizedBox(
              height: 30,
            ),

            const Text(
              "Featuered Products",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                ProductCard(
                    imageUrl: 'assets/images/PhoneBrand.jpg',
                    title: 'iphone 15',
                    price: 600),
                SizedBox(
                  width: 10,
                ),
                ProductCard(
                  imageUrl: 'assets/images/PhoneBrand.jpg',
                  title: 'smart phone',
                  price: 30,
                ),
              ],
            ),

            const SizedBox(
              height: 400,
            )
          ]),
        ),
      ),
    );
  }
}
