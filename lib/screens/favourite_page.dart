import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../providers/products_state_notifier.dart';
import '../widgets/favourite_product_card.dart';

final favCourtsProvider = Provider<List<Product>>((ref) {
  return ref
      .watch(productsStateNotifierProvider)
      .where((court) => court.isFav == true)
      .toList();
});

class FavouritePage extends ConsumerWidget {
  const FavouritePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Visibility(
      visible: ref.watch(favCourtsProvider).isNotEmpty,
      replacement: const Center(
        child: Text(
          "Your Favourites List is currently Empty !",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var product = ref.read(favCourtsProvider)[index];
            return FavouriteProductCard(
              product: product,
              onFavTapped: (status) {
                if (status) {
                  ref
                      .read(productsStateNotifierProvider.notifier)
                      .removeToFavourite(product);
                } else {
                  ref
                      .read(productsStateNotifierProvider.notifier)
                      .addToFavourite(product);
                }
              },
            );
          },
          itemCount: ref.watch(favCourtsProvider).length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 15,
            );
          },
        ),
      ),
    );
  }
}
