import 'package:flutter/cupertino.dart';

class Product {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  bool isFav;
  bool inCart;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    this.isFav = false,
    this.inCart = false,
  });

  static List<Product> convertToProducts(List products) {
    List<Product> productsList = [];
    debugPrint("Number of products in API response: ${products.length}");

    for (var product in products) {
      productsList.add(Product(
        id: product['id'],
        brand: product['brand'],
        images: List<String>.from(product['images']),
        thumbnail: product['thumbnail'],
        category: product['category'],
        description: product['description'],
        discountPercentage: product['discountPercentage'],
        price: product['price'],
        rating: double.parse(product['rating'].toString()),
        title: product['title'],
        stock: int.parse(product['stock'].toString()),
      ));
    }
    debugPrint("Number of products after conversion: ${productsList.length}");
    return productsList;
  }

  Product copyWith({bool? isFav, bool? inCart}) => Product(
        isFav: isFav ?? this.isFav,
        inCart: inCart ?? this.inCart,
        id: id,
        brand: brand,
        images: images,
        thumbnail: thumbnail,
        category: category,
        description: description,
        discountPercentage: discountPercentage,
        price: price,
        rating: rating,
        title: title,
        stock: stock,
      );
}
