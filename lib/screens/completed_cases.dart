import 'package:flutter/material.dart';

class CompletedCases extends StatelessWidget {
  const CompletedCases({super.key});

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

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/CompletedCases_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Congratulations on completing your cases.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildPatientRow('Nagwa Ahmed Zaki'),
                const SizedBox(height: 20),
                _buildPatientRow('Selma Mostafa Bakry'),
                const Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFFFFC107),
                  child: IconButton(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home_stu',
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPatientRow(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
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
          Image.asset(
            'assets/icons/details_icn.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2E2E2E),
              ),
            ),
          ),
          Image.asset(
            'assets/icons/Vector.png', // استخدمت الأيقونة الجديدة لعلامة الصح
            width: 24, // ضبطت حجم الأيقونة عشان تكون زي الـ Checkbox
            height: 24,
          ),
        ],
      ),
    );
  }
}
