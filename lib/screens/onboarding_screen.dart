import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  // تم إضافة صور الخلفيات لكل شاشة بالأسماء الجديدة
  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/espresso.jpg",
      "title": "RAWK",
      "subtitle":
          "استمتع بمذاق القهوة الحقيقية من أجود أنواع الحبوب المحمصة خصيصاً.",
    },
    {
      "image": "assets/latte.jpg",
      "title": "نكهات مصممة لمزاجك",
      "subtitle":
          "اختر مشروبك المفضل وتذوق القهوة الطازجة بالطريقة التي تحبها.",
    },
    {
      "image": "assets/cappuccino.jpg",
      "title": "قهوتك بين يديك في دقائق",
      "subtitle": "اطلب بسهولة واستلم كوبك ساخناً أينما كنت دون انتظار.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // صورة الخلفية التي تملىء الشاشة
                  Image.asset(
                    onboardingData[index]["image"]!,
                    fit: BoxFit.cover,
                  ),
                  // طبقة تغميق خفيفة (Overlay) لضمان وضوح النصوص
                  Container(
                    color: Colors.black.withOpacity(0.45),
                  ),
                  // محتوى الشاشة
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (index == 0) ...[
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Color(0xFFD4A373),
                            child: Icon(Icons.coffee,
                                size: 40, color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "R A W K",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 4,
                            ),
                          ),
                        ],
                        const Spacer(),
                        Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          onboardingData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6F4E37),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            if (_currentIndex < onboardingData.length - 1) {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            } else {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            _currentIndex == onboardingData.length - 1
                                ? "Get Started"
                                : "Next",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 50,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
