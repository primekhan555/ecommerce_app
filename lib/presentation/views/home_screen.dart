import 'package:ecommerceapp/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_constants.dart';
import '../../providers/home_provider.dart';
import '../components/custom_appbar.dart';
import '../components/product_widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = "home_screen";
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);
    final searchPro = ref.watch(searchProvider);
    return Scaffold(
      appBar: const CustomAppBar(showBackArrow: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (searchPro.isSearchActive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin),
              child: TextField(
                controller: ref.read(searchProvider).searchController,
                onChanged: (v) => ref.read(searchProvider).change(),
                decoration: const InputDecoration(hintText: 'Search Here'),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin),
            child: Text(
              "Products",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          // Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.kDefaultPaddin),
              child: searchPro.isSearchActive
                  ? ProductsWidget(
                      products: ref.watch(searchProvider).filteredProducts)
                  : productsAsyncValue.when(
                      data: (products) => ProductsWidget(products: products),
                      error: (error, stackTrace) =>
                          const Center(child: Text('Error')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator())),
            ),
          ),
        ],
      ),
    );
  }
}
