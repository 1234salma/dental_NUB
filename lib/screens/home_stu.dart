import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // استقبال البيانات من WelcomeDoctorScreen
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String userName = arguments?['userName'] ?? 'Angela';
    final String userEmail = arguments?['userEmail'] ?? 'Dr.angela@gmail.com';
    final String clinic = arguments?['clinic'] ?? '';
    final String id = arguments?['id'] ?? '';
    final String academicYear = arguments?['academicYear'] ?? '';
    final String phone = arguments?['phone'] ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFF1F5382),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () {
            Navigator.pushNamed(context, '/choose_role');
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi $userName',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  userEmail,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(Icons.settings, color: Colors.white, size: 28),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/teeth.png',
                  height: screenHeight * 0.15,
                ),
                const SizedBox(height: 15),
                _buildCustomButton(
                  context,
                  'Cases',
                  screenWidth * 0.35,
                  selectedTab == 'Cases',
                  () {
                    setState(() {
                      selectedTab = 'Cases';
                    });
                    // التنقل لـ MyPatientListScreen مع تمرير البيانات
                    Navigator.pushNamed(
                      context,
                      '/my_patient_list', // تعديل المسار ليطابق main.dart
                      arguments: {
                        'userName': userName,
                        'userEmail': userEmail,
                        'clinic': clinic,
                        'id': id,
                        'academicYear': academicYear,
                        'phone': phone,
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/tools.png',
                  height: screenHeight * 0.15,
                ),
                const SizedBox(height: 15),
                _buildCustomButton(
                  context,
                  'Community NUB',
                  screenWidth * 0.35,
                  selectedTab == 'Community NUB',
                  () {
                    setState(() {
                      selectedTab = 'Community NUB';
                    });
                    Navigator.pushNamed(context, '/community_store');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(
    BuildContext context,
    String text,
    double width,
    bool isSelected,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: isSelected ? Colors.blue[100] : Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1F5382),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}