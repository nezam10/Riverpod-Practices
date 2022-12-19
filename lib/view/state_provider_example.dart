import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];
final productProvider = Provider<List<Product>>((ref) {
  return _products;
});

class StateProviderExapmle extends ConsumerWidget {
  const StateProviderExapmle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(product.price.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Product Class
class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}
