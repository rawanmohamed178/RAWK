import 'package:flutter/material.dart';
import 'customize_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // القائمة بأسماء الصور الجديدة الواضحة والمرتبة
  final List<Map<String, String>> coffeeList = const [
    {
      "name": "Cappuccino",
      "desc": "Classic Italian coffee with steamed milk foam",
      "price": "150 EGP",
      "image": "assets/cappuccino.jpg"
    },
    {
      "name": "Espresso",
      "desc": "Double shot of intense, concentrated dark coffee",
      "price": "90 EGP",
      "image": "assets/espresso.jpg"
    },
    {
      "name": "Latte",
      "desc": "Rich espresso blended with silky steamed milk",
      "price": "160 EGP",
      "image": "assets/latte.jpg"
    },
    {
      "name": "Mocha",
      "desc": "Chocolate flavored warm coffee delight",
      "price": "180 EGP",
      "image": "assets/mocha.jpg"
    },
    {
      "name": "Macchiato",
      "desc": "Espresso with a dash of foamed milk",
      "price": "130 EGP",
      "image": "assets/macchiato.jpg"
    },
    {
      "name": "Americano",
      "desc": "Espresso with hot water for a smooth taste",
      "price": "110 EGP",
      "image": "assets/americano.jpg"
    },
    {
      "name": "Flat White",
      "desc": "Smooth microfoam over rich espresso shots",
      "price": "140 EGP",
      "image": "assets/flat_white.jpg"
    },
    {
      "name": "Iced Coffee",
      "desc": "Chilled refreshing coffee to cool your day",
      "price": "170 EGP",
      "image": "assets/iced_coffee.jpg"
    },
    {
      "name": "Special RAWK",
      "desc": "Our signature secret blend crafted for coffee lovers",
      "price": "200 EGP",
      "image": "assets/special_rawk.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Find Your Drink",
          style: TextStyle(
              color: Color(0xFF3B2314),
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.notifications_none, color: Color(0xFF3B2314)),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search For Espresso...",
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: const Icon(Icons.tune, color: Color(0xFF6F4E37)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("120 Item",
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: coffeeList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = coffeeList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomizeScreen()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown.withOpacity(0.04),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16)),
                              child: Image.asset(
                                item["image"]!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item["name"]!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF3B2314))),
                                const SizedBox(height: 2),
                                Text(item["desc"]!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                                const SizedBox(height: 6),
                                Text(item["price"]!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF6F4E37),
                                        fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF6F4E37),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }
}
