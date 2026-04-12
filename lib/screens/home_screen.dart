import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      Product(
        name: "Playstation 5 Digital Edition",
        category: "Game console",
        image: "assets/play.png",
        price: 499,
      ),
      Product(
      name: "Playstation 5",
      category: "Game console",
      image: "assets/consola.png",
      price: 499,
      ),
      Product(
        name: "DualSense Wireless Controller",
        category: "Gaming Controller",
        image: "assets/dualcontrol.png",
        price: 70,
      ),
      Product(
        name: "Wireless Headset",
        category: "Audio",
        image: "assets/headset.png",
        price: 120,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: products[index],
                    isFavorite: index == 1,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(product: products[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(products: products),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.menu),
          Text(
            "PS5",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}