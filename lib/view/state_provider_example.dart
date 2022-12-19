import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];
final productProvider = Provider<List<Product>>((ref) {
  return _products;
});

enum ProductSortType {
  name,
  price,
}

class StateProviderExapmle extends ConsumerWidget {
  const StateProviderExapmle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final cunterValue = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          DropdownButton<ProductSortType>(
            value: ProductSortType.price,
            onChanged: (value) {},
            items: [
              DropdownMenuItem(
                child: Icon(Icons.sort_by_alpha),
                value: ProductSortType.name,
              ),
              DropdownMenuItem(
                child: Icon(Icons.sort_by_alpha),
                value: ProductSortType.price,
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
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
          Text("cunterValue = $cunterValue"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(cunterProvider.notifier).state =
          //     ref.read(cunterProvider.notifier).state + 1;
          ref.read(counterProvider.notifier).update((state) => state + 1);
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
