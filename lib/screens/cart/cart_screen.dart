import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson_one/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Column(
                children: cartProducts.map((product) {
                  return Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Image.asset(product.image, width: 60, height: 60),
                        const SizedBox(width: 10),
                        Text(product.title),
                        const Expanded(child: SizedBox()),
                        Text('USD ${product.price}'),
                      ],
                    ),
                  );
                }).toList(), // output cart products here
              ),
              if(total != 0)
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'TOTAL PRICE - USD $total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // output totals here
            ],
          ),
        ),
      ),
    );
  }
}
