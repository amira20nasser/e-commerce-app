import 'package:ecommerce/providers/products_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../widgets/product_card2.dart';

final filterdProducts = StateProvider<List<Product>>((ref) {
  return [];
});

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void performSearch(String query) {
      // Filter products based on the search query
      ref.read(filterdProducts.notifier).state = ref
          .watch(productsStateNotifierProvider)
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    void clearSearch() {
      ref.read(filterdProducts.notifier).state = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.black),
              ),
              child: TextFormField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  performSearch(value);
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
            Expanded(
              child: ref.watch(filterdProducts).isEmpty
                  ? const Center(child: Text('No results found.'))
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemCount: ref.watch(filterdProducts).length,
                      itemBuilder: (context, index) {
                        Product product = ref.watch(filterdProducts)[index];
                        return SizedBox(
                          height: 280,
                          // width: 200,
                          child: ProductCard2(
                            product: product,
                            onFavTapped: (status) {
                              if (status) {
                                ref
                                    .read(
                                        productsStateNotifierProvider.notifier)
                                    .removeToFavourite(product);
                              } else {
                                ref
                                    .read(
                                        productsStateNotifierProvider.notifier)
                                    .addToFavourite(product);
                              }
                            },
                            onCartTapped: (status) {
                              if (status) {
                                ref
                                    .read(
                                        productsStateNotifierProvider.notifier)
                                    .addToCart(product);
                              } else {
                                ref
                                    .read(
                                        productsStateNotifierProvider.notifier)
                                    .removeToCart(product);
                              }
                            },
                          ),
                        );
                      },
                    ),
            ),
            if (ref.watch(filterdProducts).isNotEmpty)
              ElevatedButton(
                onPressed: clearSearch,
                child: const Text('Clear Search'),
              ),
          ],
        ),
      ),
    );
  }
}
