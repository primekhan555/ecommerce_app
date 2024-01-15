import 'package:ecommerceapp/navigation/navigation.dart';
import 'package:ecommerceapp/navigation/params/details_screen_args.dart';
import 'package:ecommerceapp/presentation/components/item_card.dart';
import 'package:ecommerceapp/presentation/views/details_screen.dart';
import 'package:flutter/material.dart';

import '../../api_resources/api_models/products_model.dart';
import '../../constants/app_constants.dart';

class ProductsWidget extends StatelessWidget {
  final List<Products> products;

  const ProductsWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppConstants.kDefaultPaddin,
        crossAxisSpacing: AppConstants.kDefaultPaddin,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => ItemCard(
          product: products[index],
          press: () => Navigation.pushNamed(DetailsScreen.routeName,
              arguments: DetailsScreenArgs(product: products[index]))),
    );
  }
}
