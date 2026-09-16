import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const RawkCoffeeApp(),
      ),
    );

class RawkCoffeeApp extends StatelessWidget {
  const RawkCoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAWK Coffee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF5A3825),
        scaffoldBackgroundColor: const Color(0xFFF7F2EC),
        fontFamily: 'Poppins',
      ),
      home: const OnboardingScreen(),
    );
  }
}
