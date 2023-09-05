import 'package:ecommerce/providers/custom_api_service.dart';
import 'package:ecommerce/providers/user_data.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../services/dio_helper.dart';

final productsStateNotifierProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});

class ProductsNotifier extends StateNotifier<List<Product>> {
  final customApiService = CustomApiService();

  ProductsNotifier() : super([]) {
    getData().then((value) => getFav());
  }

  Future<void> getData() async {
    List<Product> products = [];
    List productsList = await DioHelper().getProducts(
      path: "https://dummyjson.com/products",
    );

    products = Product.convertToProducts(productsList);
    state = products;
  }

  Future<void> getFav() async {
    List favProducts = UserData().favourites;
    favProducts = await customApiService.getUserFavorites();
    favProducts.sort();
    debugPrint(" !!!get Fav: $favProducts");
    state = [
      for (final product in state)
        if (favProducts.contains(product.id.toString()))
          product.copyWith(isFav: true)
        else
          product
    ];
  }

  void addToFavourite(Product selectedProduct) {
    customApiService.addUserFavorite(
        UserData().email, selectedProduct.id.toString());
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(isFav: true)
        else
          product
    ];
  }

  void removeToFavourite(Product selectedProduct) async {
    UserData().favourites = await customApiService.getUserFavorites();
    customApiService.removeUserFavorite(
      UserData().email,
      selectedProduct.id.toString(),
    );
    UserData()
        .favourites
        .removeWhere((element) => element == selectedProduct.id.toString());
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(isFav: false)
        else
          product
    ];
  }

  void addToCart(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(inCart: true)
        else
          product
    ];
  }

  void removeToCart(Product selectedProduct) {
    state = [
      for (final product in state)
        if (product.id == selectedProduct.id)
          selectedProduct.copyWith(inCart: false)
        else
          product
    ];
  }
}
