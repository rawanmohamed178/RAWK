import 'package:flutter/material.dart';

class CustomizeScreen extends StatelessWidget {
  const CustomizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Customize", style: TextStyle(color: Color(0xFF3B2314))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF3B2314)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.brown.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                  child: Icon(Icons.local_cafe,
                      size: 80, color: Color(0xFF5A3825))),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Cappuccino",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.remove_circle_outline),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("1", style: TextStyle(fontSize: 16))),
                    Icon(Icons.add_circle, color: Color(0xFF5A3825)),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text("Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _SizeOption(
                    size: "Small",
                    ml: "150 ml",
                    price: "90 EGP",
                    isSelected: false),
                _SizeOption(
                    size: "Medium",
                    ml: "250 ml",
                    price: "150 EGP",
                    isSelected: true),
                _SizeOption(
                    size: "Large",
                    ml: "400 ml",
                    price: "200 EGP",
                    isSelected: false),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A3825),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {},
              child: const Text("Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size, ml, price;
  final bool isSelected;
  const _SizeOption(
      {required this.size,
      required this.ml,
      required this.price,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF5A3825) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.brown.shade200),
      ),
      child: Column(
        children: [
          Text(ml,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold)),
          Text(size,
              style: TextStyle(
                  color:
                      isSelected ? Colors.white.withOpacity(0.7) : Colors.grey,
                  fontSize: 12)),
          Text(price,
              style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF5A3825),
                  fontSize: 12)),
        ],
      ),
    );
  }
}
