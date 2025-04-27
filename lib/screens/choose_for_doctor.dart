import 'package:flutter/material.dart';
import 'settings_screen.dart';

class DoctorHomeView extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String academicYear;
  final String phone;
  final String clinic;
  final String id;

  const DoctorHomeView({
    super.key,
    required this.userName,
    required this.userEmail,
    this.academicYear = '',
    this.phone = '',
    this.clinic = '',
    this.id = '',
    required String role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E5481),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/aya.png'),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi $userName!',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        userEmail,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF2F2F2),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),

            // Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الشمال: أيقونة وتكست وبوتون
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 30,
                          color: Color(0xFF1E5481),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'You can view patients from here.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'And then diagnose them easily.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, "/patient_list_view");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF1E5481),
                              side: const BorderSide(
                                color: Color(0xFF1E5481),
                              ),
                              elevation: 3,
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
                  const SizedBox(width: 15),
                  // اليمين: الصورة
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/storyset1.png',
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(flex: 3),
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
                          role: 'Consultant',
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
