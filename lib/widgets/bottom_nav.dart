import 'package:flutter/material.dart';
import '../screens/search_screen.dart';
import '../models/product.dart';
import '../screens/profile_screen.dart';

class BottomNav extends StatelessWidget {
  final List<Product> products;

  const BottomNav({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.home, color: Colors.white),

            // 🔍 BOTÓN BUSCAR
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchScreen(products: products),
                  ),
                );
              },
              child: const Icon(Icons.search, color: Colors.white),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                );
              },
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const Icon(Icons.shopping_cart, color: Colors.white54),
          ],
        ),
      ),
    );
  }
}