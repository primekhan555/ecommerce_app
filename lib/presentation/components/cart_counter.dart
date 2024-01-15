import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api_resources/api_models/products_model.dart';
import '../../constants/app_constants.dart';
import '../../providers/cart_provider.dart';

class CartCounter extends ConsumerWidget {
  final Products product;
  const CartCounter({super.key, required this.product});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<CartItem> cartItems = ref.watch(cartProvider).cart;
    final cartNotifier = ref.watch(cartProvider);
    CartItem? cartItem = cartNotifier.findProductById(product.id!);
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              cartNotifier.minusItem(product);
            },
            child:const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin / 2),
          child: Consumer(builder: (context, ref, child) {
            // final cartNotifier = ref.watch(cartProvider);
            // CartItem? cartItem = cartNotifier.findProductById(product.id!);
            return Text(
              (cartItem?.quantity ?? 0).toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.titleMedium,
            );
          }),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              cartNotifier.addItem(product);
            },
            child:const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
