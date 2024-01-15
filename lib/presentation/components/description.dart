import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Products product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppConstants.kDefaultPaddin),
      child: Text(
        product.name??'',
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
