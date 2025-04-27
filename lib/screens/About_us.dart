import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Here's what our application is all about:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/images/cute.png',
                    width: 120,
                    height: 120,
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
                      const SizedBox(height: 15),
                      buildPointItem(
                        text:
                            'The application helps dental students to find patient cases easily.',
                      ),
                      const SizedBox(height: 15),
                      buildPointItem(
                        text:
                            'Patients can book appointments and receive better healthcare through the app.',
                      ),
                      const SizedBox(height: 15),
                      buildPointItem(
                        text:
                            'The app automatically distributes cases to students based on academic year and ranking.',
                      ),
                      const SizedBox(height: 15),
                      buildPointItem(
                        text:
                            'DentalNUB aims to enhance dental education and patient treatment quality.',
                      ),
                      const SizedBox(height: 15),
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
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildBottomItem(
                    icon: Icons.home, label: 'Home', isSelected: false),
                buildBottomItem(
                    icon: Icons.settings, label: 'Setting', isSelected: false),
                const SizedBox(width: 60),
              ],
            ),
            Positioned(
              top: -30,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: const Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 30,
                ),
              ),
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
        Icon(
          isMission ? Icons.adjust : Icons.check_circle_rounded,
          color: const Color(0xFFFFC107),
          size: 24,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBottomItem(
      {required IconData icon,
      required String label,
      required bool isSelected}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: const Color(0xFF1E5481),
          size: 28,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1E5481),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
