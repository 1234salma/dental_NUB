import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
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
                "assets/images/comm.png",
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
                  Navigator.pushNamed(context, "/welcome");
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
            
            // النصوص والـ dots والأيقونة
            Positioned(
              bottom: 75,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  
                  // الـ dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 3,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 5),
                      Container(
                        width: 35,
                        height: 3,
                        color: const Color(0xFF1F5382),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                
                  // النص العنوان
                  const Text(
                    "Community Tools",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F5382),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                
                  // النص الفرعي (هنا تم التصحيح)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      "Save money by buying pre-owned tools from your peers or sell what you no longer need easily with Community Tools.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600], // تم التصحيح من Colors.grey.600 إلى Colors.grey[600]
                      ),
                    ),
                  ),
                
                  const SizedBox(height: 10),
                  // الأيقونة وكلمة Dental
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Dental",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
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
                  width: 130,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/welcome");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F5382),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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