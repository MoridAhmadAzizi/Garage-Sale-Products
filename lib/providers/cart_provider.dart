import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson_one/models/product.dart';

class CartNotifier extends Notifier<Set<Product>>{
  @override
  build(){
    return {
      Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/products/shorts.png'),
    };
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>((){
  return CartNotifier();
});