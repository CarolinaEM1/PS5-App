import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import '../models/product.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 👤 Imagen de perfil
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/yoo.png'),
            ),

            const SizedBox(height: 10),

            // 🧑 Nombre
            const Text(
              "Carolina Martínez",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // 📧 Email
            const Text(
              "carolina@email.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // ⚙️ Opciones
            _option(Icons.person, "Editar perfil"),
            _option(Icons.lock, "Cambiar contraseña"),
            GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FavoritesScreen(
                    favoriteProducts: [
                      Product(
                        name: "Playstation 5",
                        category: "Game console",
                        image: "assets/play.png",
                        price: 499,
                      ),
                    ],
                  ),
                ),
              );
            },
            child: _option(Icons.favorite, "Favoritos"),
          ),
            _option(Icons.shopping_bag, "Mis compras"),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: _option(Icons.logout, "Cerrar sesión"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _option(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}