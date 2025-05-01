import 'package:flutter/material.dart';

import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = '';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String userName = arguments?['userName'] ?? 'Angela';
    final String userEmail = arguments?['userEmail'] ?? 'Dr.angela@gmail.com';
    final String academicYear = arguments?['academicYear'] ?? '';
    final String phone = arguments?['phone'] ?? '';
    final String clinic = arguments?['clinic'] ?? '';
    final String id = arguments?['id'] ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFF1E5481),
      body: SafeArea(
        child: SingleChildScrollView(
          // إضافة SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/student_image.webp'),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi $userName!',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userEmail,
                          style: const TextStyle(
                            color: Color(0xFFE1E1E1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Cases Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F8FA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline,
                                  color: Color(0xFF1E5481),
                                  size: 24,
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'You have a new case !',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2E2E2E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 'Cases';
                                  });
                                  Navigator.pushNamed(
                                    context,
                                    '/my_patient_list',
                                    arguments: {
                                      'userName': userName,
                                      'userEmail': userEmail,
                                      'academicYear': academicYear,
                                      'phone': phone,
                                      'clinic': clinic,
                                      'id': id,
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1E5481),
                                  side: const BorderSide(
                                    color: Color(0xFF1E5481),
                                    width: 1.5,
                                  ),
                                  elevation: 2,
                                  shadowColor: Colors.black.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  'Open',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/third.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Community Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F8FA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.travel_explore_outlined,
                                  color: Color(0xFF1E5481),
                                  size: 24,
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'You can now explore our\ncommunity!',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2E2E2E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedTab = 'Community NUB';
                                  });
                                  Navigator.pushNamed(
                                      context, '/community_store');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1E5481),
                                  side: const BorderSide(
                                    color: Color(0xFF1E5481),
                                    width: 1.5,
                                  ),
                                  elevation: 2,
                                  shadowColor: Colors.black.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  'Open',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/mytool.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Completed Cases Card (السكشن الجديدة)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F8FA),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color(0xFFFFC107),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Expanded(
                                  child: Text(
                                    'View Your Completed\nCases Now!',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2E2E2E),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  // التنقل لشاشة CompletedCases
                                  Navigator.pushNamed(
                                    context,
                                    '/completed_cases',
                                    arguments: {
                                      'userName': userName,
                                      'userEmail': userEmail,
                                      'academicYear': academicYear,
                                      'phone': phone,
                                      'clinic': clinic,
                                      'id': id,
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFF1E5481),
                                  side: const BorderSide(
                                    color: Color(0xFF1E5481),
                                    width: 1.5,
                                  ),
                                  elevation: 2,
                                  shadowColor: Colors.black.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/pana.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // مساحة إضافية في الأخر عشان الـ BottomNavigationBar تبان
              ],
            ),
          ),
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
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFFFFC107),
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Home',
                  style: TextStyle(
                    color: Color(0xFF1E5481),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Setting
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 28,
                    color: Color(0xFF1E5481),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          role: 'Doctor',
                          userName: userName,
                          userEmail: userEmail,
                          academicYear: academicYear,
                          phone: phone,
                          clinic: clinic,
                          id: id,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                const Text(
                  'Setting',
                  style: TextStyle(
                    color: Color(0xFF1E5481),
                  ),
                ),
              ],
            ),
            // About Us
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.info,
                    size: 28,
                    color: Color(0xFF1E5481),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/about_us');
                  },
                ),
                const SizedBox(height: 4),
                const Text(
                  'About Us',
                  style: TextStyle(
                    color: Color(0xFF1E5481),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}