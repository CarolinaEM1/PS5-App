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
                      height: 100,
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
                                      height: 75,
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
    width: double.infinity,
    padding: const EdgeInsets.only(top: 10, bottom: 18),
    decoration: const BoxDecoration(
      color: Color(0xFF1B2233),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),

        Image.asset(
          "assets/PS5Control.png",
          height: 28,
        ),

        IconButton(
          icon: const Icon(Icons.settings, color: Colors.white),
          onPressed: () {},
        ),
      ],
    ),
  );
}

  Widget _buySection(Product product) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    height: 70,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFF2F6FE4),
          Color(0xFF5AA1FF),
        ],
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      children: [

        /// PRECIO
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        /// BOTON BUY NOW (CENTRADO EN EL MISMO OVALO)
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Center(
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F6FE4),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
}