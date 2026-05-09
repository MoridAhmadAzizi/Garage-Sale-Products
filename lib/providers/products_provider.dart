import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lesson_one/models/product.dart';
part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(id: '1', title: 'Groovy Shorts', price: 12, image: 'assets/products/shorts.png'),
  Product(id: '2', title: 'Karati Kit', price: 34, image: 'assets/products/karati.png'),
  Product(id: '3', title: 'Denim Jeans', price: 54, image: 'assets/products/jeans.png'),
  Product(id: '4', title: 'Red Backpack', price: 12, image: 'assets/products/backpack.png'),
  Product(id: '5', title: 'Drum & Sticks', price: 23, image: 'assets/products/drum.png'),
  Product(id: '6', title: 'Blue Suitcase', price: 43, image: 'assets/products/suitcase.png'),
  Product(id: '7', title: 'Roller Skates', price: 54, image: 'assets/products/skates.png'),
  Product(id: '8', title: 'Electric Guitar', price: 76, image: 'assets/products/guitar.png'),
];

@riverpod
List<Product> products($Ref){
  return allProducts;
}

@riverpod
List<Product> reducedProducts($Ref){
  return allProducts.where((p) => p.price < 50).toList();
}
