import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson_one/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return const {
      Product(
        id: '4',
        title: 'Red Backpack',
        price: 12,
        image: 'assets/products/backpack.png',
      ),
    };
  }

  //   Methods to updated State
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
