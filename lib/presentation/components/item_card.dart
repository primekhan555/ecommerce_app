import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:ecommerceapp/api_resources/api_services/api_services.dart';
import 'package:ecommerceapp/presentation/components/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final Products product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(AppConstants.kDefaultPaddin),
              decoration: BoxDecoration(
                // color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network("http://${product.imageUrl??''}",
                headers: ApiServices.headerss,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppConstants.kDefaultPaddin / 4),
            child: Text(
              product.name??'',
              style: const TextStyle(color: AppColors.kTextLightColor),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$${product.price?.current?.value??0}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              CartCounter(product: product,)
            //   IconButton(
            //   icon: SvgPicture.asset(
            //     "assets/icons/cart.svg",
            //     height: 20,
            //     colorFilter: ColorFilter.mode(AppColors.kTextColor, BlendMode.srcIn),
            //   ),
            //   onPressed: () {},
            // ),
            ],
          )
        ],
      ),
    );
  }
}
