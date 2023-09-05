import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/widgets/cart_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import '../providers/products_state_notifier.dart';

final cartProductsProvider = Provider<List<Product>>((ref) {
  return ref
      .watch(productsStateNotifierProvider)
      .where((product) => product.inCart == true)
      .toList();
});

final totalAmountProvider = Provider<double>((ref) {
  return ref
      .watch(cartProductsProvider)
      .fold(0, (previousValue, product) => (product.price) + previousValue);
});

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontFamily: "display",
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Visibility(
              visible: ref.watch(cartProductsProvider).isNotEmpty,
              replacement: const Center(
                child: Text(
                  "Your Cart is Empty !",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var product = ref.read(cartProductsProvider)[index];
                  return Dismissible(
                    key: ValueKey(product.id),
                    direction: DismissDirection.endToStart,
                    movementDuration: const Duration(milliseconds: 400),
                    background: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(color: AppColors.orange),
                      child: const Text(
                        "Remove from Cart",
                        style: TextStyle(
                          fontFamily: "display",
                          fontSize: 20,
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) =>
                        Future.value(direction == DismissDirection.endToStart),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        ref
                            .read(productsStateNotifierProvider.notifier)
                            .removeToCart(product);
                      }
                    },
                    child: CartProduct(
                      product: product,
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
                    ),
                  );
                },
                itemCount: ref.watch(cartProductsProvider).length,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 15);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text(
                "Total",
                style: TextStyle(
                  color: AppColors.orange,
                  fontFamily: "display",
                ),
              ),
              subtitle: Text(
                "\$${ref.watch(totalAmountProvider)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "display",
                  fontSize: 18,
                ),
              ),
              tileColor: AppColors.black,
              trailing: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                ),
                child: const Text(
                  "Check Out",
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: "display",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
