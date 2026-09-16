import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F0),
      appBar: AppBar(
        title: const Text("My Cart",
            style: TextStyle(
                color: Color(0xFF3B2314), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF3B2314)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(
                    name: "Cappuccino",
                    size: "Medium (250 ml)",
                    price: "150 EGP",
                    image: "assets/iced_coffee.jpg",
                  ),
                  const SizedBox(height: 12),
                  _buildCartItem(
                    name: "Espresso",
                    size: "Small (150 ml)",
                    price: "90 EGP",
                    image: "assets/espresso.jpg",
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3B2314))),
                      Text("240 EGP",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6F4E37))),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6F4E37),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {},
                    child: const Text("Proceed to Checkout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
      {required String name,
      required String size,
      required String price,
      required String image}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF3B2314))),
                const SizedBox(height: 4),
                Text(size,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                Text(price,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F4E37),
                        fontSize: 14)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
