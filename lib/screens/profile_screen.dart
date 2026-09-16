import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F6),
      appBar: AppBar(
        title: const Text("Profile",
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
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFFE8E0D5),
                child: Icon(Icons.person, size: 50, color: Color(0xFF6F4E37)),
              ),
            ),
            const SizedBox(height: 12),
            const Text("Rawan Mohammed",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3B2314))),
            const SizedBox(height: 4),
            const Text("rawan@example.com",
                style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 20),
            // Points Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF5B3A29),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.coffee, color: Colors.amber, size: 30),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Points Balance: 250 Points",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                      SizedBox(height: 4),
                      Text("50 more points until a free cup!",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildProfileOption(Icons.receipt_long, "My Orders"),
            _buildProfileOption(Icons.location_on_outlined, "Saved Addresses"),
            _buildProfileOption(Icons.payment, "Payment Methods"),
            _buildProfileOption(Icons.notifications_none, "Notifications"),
            _buildProfileOption(Icons.settings_outlined, "Account Settings"),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5B3A29),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {},
              child: const Text("Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF5B3A29)),
        title: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF3B2314),
                fontSize: 14)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
