import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/feature_item.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF2F5),
      body: SafeArea(
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: Column(
                children: [
                  Image.asset(product.image, height: 250),
                  const SizedBox(height: 20),
                  const Text(
                    "DUALSENSE",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      FeatureItem(icon: Icons.mic, text: "Microphone"),
                      FeatureItem(icon: Icons.headphones, text: "Headset Jack"),
                      FeatureItem(icon: Icons.vibration, text: "Motion Sensor"),
                    ],
                  ),
                  const Spacer(),
                  _buySection(product),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          const Text("PS5", style: TextStyle(fontWeight: FontWeight.bold)),
          const Icon(Icons.settings),
        ],
      ),
    );
  }

  Widget _buySection(Product product) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "\$${product.price}",
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            onPressed: () {},
            child: const Text("Buy Now"),
          ),
        ],
      ),
    );
  }
}