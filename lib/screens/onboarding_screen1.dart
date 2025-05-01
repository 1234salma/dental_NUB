import 'package:flutter/material.dart';

import 'onboarding_screen2.dart';
import 'welcome.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        // إضافة الصورة كخلفية
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wave.png'),
            fit: BoxFit.cover, // الصورة تغطي الشاشة بالكامل
          ),
        ),
        child: Stack(
          children: [
            // الصورة العلوية
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Image.asset(
                "assets/images/chat.png",
                width: screenWidth - 80,
                height: (screenHeight * 0.35),
                fit: BoxFit.contain,
              ),
            ),
            
            // زر Skip
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            // النصوص والـ dots والزر
            Positioned(
              bottom: 120,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // الـ dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 3,
                        color: Colors.black, // نفس لون الـ dot في الديزاين
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 35,
                        height: 3,
                        color: Colors.black54, // لون فاتح للـ dot التاني
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                
                  // النص العنوان
                  const Text(
                    "Chat AI",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F5382), // نفس لون النص في الديزاين
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
          
                  // النص الفرعي
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      "Got a question about your dental health or appointment? Chat with our AI assistant anytime, just like talking to a dental expert.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // نفس لون النص في الديزاين
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // زر Next
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F5382),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}