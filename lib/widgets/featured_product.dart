import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/app_colors.dart';
import '../providers/products_state_notifier.dart';
import 'product_card2.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    super.key,
    required this.numOfProduct,
  });
  final int numOfProduct;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => SizedBox(
        width: double.infinity,
        child: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(const Duration(seconds: 4), () {
              ref.invalidate(productsStateNotifierProvider);
            });
          },
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount:
                ref.watch(productsStateNotifierProvider).length ~/ numOfProduct,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
            ),
            itemBuilder: (context, index) {
              var product = ref.read(productsStateNotifierProvider)[index];
              return ref.watch(productsStateNotifierProvider).isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.orange,
                      ),
                    )
                  : ProductCard2(
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
                      onCartTapped: (status) {
                        if (status) {
                          ref
                              .read(productsStateNotifierProvider.notifier)
                              .addToCart(product);
                        } else {
                          ref
                              .read(productsStateNotifierProvider.notifier)
                              .removeToCart(product);
                        }
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
