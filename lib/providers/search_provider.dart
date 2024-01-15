// ignore_for_file: prefer_final_fields

import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:ecommerceapp/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchProvider = ChangeNotifierProvider<SearchNotifier>((ref) {
  final productsAsyncValue = ref.watch(productsProvider).value ?? [];
  return SearchNotifier(productsAsyncValue);
});

class SearchNotifier extends ChangeNotifier {
  List<Products> _products = [];
  bool _isSearchActive = false;
  bool get isSearchActive => _isSearchActive;
  SearchNotifier(this._products);


  TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;
  change(){
    notifyListeners();
  }
  List<Products> get filteredProducts => _products
      .where((product) => product.name!
          .toLowerCase()
          .contains(_searchController.text.toLowerCase()))
      .toList();
  activateSearch() {
    _isSearchActive = !_isSearchActive;
    notifyListeners();
  }
}
