import 'package:flutter/material.dart';
import 'patient_list_screen.dart';
import 'community_store.dart'; // لو عندك الشاشة دي

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = ''; // بداية بدون تفعيل

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F5382),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('images/profile.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Angela',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Dr.angela@gmail.com',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.settings, color: Colors.white, size: 28),
                ],
              ),

              SizedBox(height: 100),

              // Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCustomCard(
                    label: 'Cases',
                    image: 'images/teeth.png',
                    isSelected: selectedTab == 'Cases',
                    onTap: () {
                      setState(() {
                        selectedTab = 'Cases';
                      });

                      Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyPatientListScreen(),
                          ),
                        );
                      });
                    },
                  ),
                  buildCustomCard(
                    label: 'Community NUB',
                    image: 'images/tools.png',
                    isSelected: selectedTab == 'Community NUB',
                    onTap: () {
                      setState(() {
                        selectedTab = 'Community NUB';
                      });

                      Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityStore(),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCustomCard({
    required String label,
    required String image,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool isTapped = isSelected;
    final Color backgroundColor = isTapped ? Color(0xFF1F5382) : Colors.white;
    final Color textColor = isTapped ? Colors.white : Color(0xFF1F5382);
    final Border? border =
        isTapped ? Border.all(color: Colors.white, width: 1.5) : null;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image, width: 140, height: 140, fit: BoxFit.contain),
          SizedBox(height: 10),
          Container(
            width: 155,
            height: 50,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: border,
            ),
            alignment: Alignment.center,
            child: Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
