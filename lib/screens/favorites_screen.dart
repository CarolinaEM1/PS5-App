import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;

  const FavoritesScreen({super.key, required this.favoriteProducts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoritos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: favoriteProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: favoriteProducts[index],
              isFavorite: true,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}