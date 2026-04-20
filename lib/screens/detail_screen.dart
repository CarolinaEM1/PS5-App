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
            _topHeader(context),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F4F8),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // IMAGEN DE DUALSENSE ARRIBA DEL CONTROL
                    Image.asset(
                      'assets/dualletras.png', // tu imagen de DUALSENSE
                      height: 85,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 10),

                    // CONTROL + CÍRCULO DE ABAJO
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      product.image,
                                      height: 250,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 6),
                                    Image.asset(
                                      'assets/circulo.png', // tu círculo azul
                                      height: 65,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 18),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Expanded(
                                    child: FeatureItem(
                                      icon: Icons.mic,
                                      text: "Built-In\nMicrophone",
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: FeatureItem(
                                      icon: Icons.headphones,
                                      text: "Headset Jack",
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: FeatureItem(
                                      icon: Icons.gamepad,
                                      text: "Motion Sensor",
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),

                    _buySection(product),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: const BoxDecoration(
        color: Color(0xFF171C2A),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Image.asset(
            'assets/ps5_logo.png', // tu logo PS5
            height: 26,
            fit: BoxFit.contain,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buySection(Product product) {
    return Container(
      margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1F6FEA),
            Color(0xFF4C94FF),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "\$${product.price}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xFF2D7BF0),
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
                vertical: 18,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
            ),
            onPressed: () {},
            child: const Text(
              "Buy Now",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}