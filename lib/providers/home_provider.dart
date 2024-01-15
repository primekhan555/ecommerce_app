import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api_resources/api_repos_abstract/home_repo.dart';
import '../api_resources/api_services/api_response.dart';
import '../core/core.dart';
import '../di/di.dart';

final productsProvider = FutureProvider<List<Products>>((ref) async {
  ApiResponse productsRes = await getIt.get<HomeRepo>().getProducts();
  console('PROVIDERR : ${productsRes.status}');
  if (productsRes.status == Status.completed) {
    ProductsModel productsModel = productsRes.data as ProductsModel;
    return productsModel.products ?? [];
  }
  return [];
});
