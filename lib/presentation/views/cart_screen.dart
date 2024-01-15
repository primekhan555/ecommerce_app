import 'package:ecommerceapp/navigation/navigation.dart';
import 'package:ecommerceapp/navigation/params/details_screen_args.dart';
import 'package:ecommerceapp/presentation/components/item_card.dart';
import 'package:ecommerceapp/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_constants.dart';
import '../components/custom_appbar.dart';
import 'details_screen.dart';

class CartScreen extends ConsumerWidget {
  static const String routeName = "cart_screen";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProducts = ref.watch(cartProvider).cart;
    final cart = ref.read(cartProvider);
    return Scaffold(
      appBar:const CustomAppBar(
        showBackArrow: false,
        showSearch: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin),
            child: Text(
              "Cart",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          // Categories(),
          Expanded(
            child:
            cartProducts.isEmpty? const Center(child: Text('No Item in Cart')):
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppConstants.kDefaultPaddin,
                    crossAxisSpacing: AppConstants.kDefaultPaddin,
                    childAspectRatio: 0.75,
                  ),
                  children: [
                    ...cartProducts
                        .map((e) => Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ItemCard(
                                    product: e.product!,
                                    press: () => Navigation.pushNamed(
                                        DetailsScreen.routeName,
                                        arguments: DetailsScreenArgs(
                                            product: e.product!))),
                                IconButton(
                                    onPressed: () => cart.removeItem(e),
                                    icon: const Icon(Icons.close))
                              ],
                            ))
                        .toList()
                  ],
                )),
          ),
        ],
      ),
    );
  }
}


