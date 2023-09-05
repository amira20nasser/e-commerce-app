import 'package:ecommerce/screens/search_screen.dart';
import 'package:ecommerce/widgets/featured_product.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Products",
          style: TextStyle(
            fontFamily: "display",
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: Colors.black),
            ),
            child: TextFormField(
              keyboardType: TextInputType.none,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ));
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const FeaturedProduct(numOfProduct: 1),
        ],
      ),
    );
  }
}
