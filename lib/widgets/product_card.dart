import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool isFavorite; // 🔥 nuevo

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isFavorite ? Colors.blue : Colors.white, // 🔥 azul si favorito
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: isFavorite ? Colors.white70 : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isFavorite ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),

            // ❤️ Corazón
            Positioned(
              top: 0,
              left: 0,
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}