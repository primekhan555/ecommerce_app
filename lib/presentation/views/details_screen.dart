import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:ecommerceapp/presentation/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_constants.dart';
import '../../navigation/params/details_screen_args.dart';
import '../components/add_to_cart.dart';
import '../components/color_and_size.dart';
import '../components/counter_with_fav_btn.dart';
import '../components/description.dart';
import '../components/product_title_with_image.dart';

class DetailsScreen extends ConsumerWidget {
  static const String routeName = "details_screen";
  final DetailsScreenArgs params;
  const DetailsScreen({super.key, required this.params});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    Products product = params.product!;
    return Scaffold(
      appBar: const CustomAppBar(showSearch: false),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  left: AppConstants.kDefaultPaddin,
                  right: AppConstants.kDefaultPaddin,
                ),
                child: Column(
                  children: <Widget>[
                    ProductTitleWithImage(product: product),
                    ColorAndSize(product: product),
                    const SizedBox(height: AppConstants.kDefaultPaddin / 2),
                    Description(product: product),
                    const SizedBox(height: AppConstants.kDefaultPaddin / 2),
                    CounterWithFavBtn(product: product),
                    const SizedBox(height: AppConstants.kDefaultPaddin / 2),
                  ],
                ),
              ),
            ),
          ),
          AddToCart(product: product)
        ],
      ),
    );
  }
}
