import 'package:ecommerceapp/api_resources/api_models/products_model.dart';
import 'package:ecommerceapp/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  Products? product;
  int quantity = 0;
  CartItem({this.product, this.quantity = 0});
  CartItem copyWith({
    Products? product,
    int? quantity,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  List<CartItem> cart = [];
  CartItem? findProductById(int productId) {
    return cart.firstWhere((item) => item.product!.id == productId,
        orElse: () => CartItem(product: null, quantity: 0));
  }

  void addItem(Products product) {
    final existingItemIndex =
        cart.indexWhere((item) => item.product!.id == product.id);
    console(product.id);
    if (existingItemIndex != -1) {
      cart[existingItemIndex] = CartItem(
          product: product, quantity: cart[existingItemIndex].quantity + 1);
    } else {
      cart.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  void minusItem(Products product) {
    final existingItemIndex =
        cart.indexWhere((item) => item.product!.id == product.id);
    if (existingItemIndex != -1) {
      if (cart[existingItemIndex].quantity > 1) {
        cart[existingItemIndex] = CartItem(
            product: product, quantity: cart[existingItemIndex].quantity - 1);
      } else {
        removeItem(CartItem(product: product));
      }
    } 
    notifyListeners();
  }

  void updateItemQuantity(CartItem cartItem, int newQuantity) {
    if (newQuantity > 0) {
      final index = cart.indexOf(cartItem);
      cart[index] = cartItem.copyWith(quantity: newQuantity);
    } else {
      removeItem(cartItem);
    }
    notifyListeners();
  }

  void removeItem(CartItem cartItem) {
    cart.removeWhere((item) => item.product!.id == cartItem.product!.id);
    notifyListeners();
  }
}
