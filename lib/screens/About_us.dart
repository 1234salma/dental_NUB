import 'package:flutter/material.dart';
import 'home_stu.dart'; // استيراد HomeScreen

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int selectedIndex = 2; // 0: Home, 1: Setting, 2: About Us

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E5481),
      body: SafeArea(
        child: Column(
          children: [
            // Blue Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome to DentalNUB!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Here's what our application is all about:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/cute.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            // White Rounded Section
            Expanded(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPointItem(
                        text:
                            'DentalNUB is a graduation project developed by computer science students.',
                      ),
                      const SizedBox(height: 20),
                      buildPointItem(
                        text:
                            'The application helps dental students to find patient cases easily.',
                      ),
                      const SizedBox(height: 20),
                      buildPointItem(
                        text:
                            'Patients can book appointments and receive better healthcare through the app.',
                      ),
                      const SizedBox(height: 20),
                      buildPointItem(
                        text:
                            'The app automatically distributes cases to students based on academic year and ranking.',
                      ),
                      const SizedBox(height: 20),
                      buildPointItem(
                        text:
                            'DentalNUB aims to enhance dental education and patient treatment quality.',
                      ),
                      const SizedBox(height: 20),
                      buildPointItem(
                        isMission: true,
                        text:
                            'Our mission is to bridge the gap between dental learning and real-world practice.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            buildBottomItem(
              icon: Icons.home,
              label: 'Home',
              index: 0,
            ),
            // Setting
            buildBottomItem(
              icon: Icons.settings,
              label: 'Setting',
              index: 1,
            ),
            // About Us
            buildBottomItem(
              icon: Icons.info,
              label: 'About Us',
              index: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPointItem({required String text, bool isMission = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 3),
          child: Icon(
            isMission ? Icons.adjust : Icons.check_circle_rounded,
            color: const Color(0xFFFFC107),
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomItem(
      {required IconData icon, required String label, required int index}) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          setState(() {
            selectedIndex = index;
          });
          Navigator.pushReplacementNamed(context, '/home_stu');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/settings');
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFFFC107),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            )
          else
            Icon(
              icon,
              color: const Color(0xFF1E5481),
              size: 28,
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? const Color(0xFFFFC107)
                  : const Color(0xFF1E5481),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
