import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  final bool isFavorite;

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
          color: isFavorite ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// IMAGEN MÁS GRANDE Y CENTRADA
                Expanded(
                  child: Center(
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.contain,
                      height: 150,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  product.category,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: isFavorite
                        ? Colors.white70
                        : Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isFavorite ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),

            /// ICONO FAVORITO
            Positioned(
              top: 0,
              left: 0,
              child: Icon(
                Icons.favorite,
                color: isFavorite
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}