import 'package:flutter/material.dart';

class WelcomeDoctorScreen extends StatefulWidget {
  final String userName;
  final String userEmail;

  const WelcomeDoctorScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  _WelcomeDoctorScreenState createState() => _WelcomeDoctorScreenState();
}

class _WelcomeDoctorScreenState extends State<WelcomeDoctorScreen> {
  final TextEditingController clinicController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController academicYearController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    clinicController.dispose();
    idController.dispose();
    academicYearController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1F5382),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Welcome Doctor !',
          style: TextStyle(
            color: Color(0xFF1F5382),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildInputField(
              label: 'Clinic',
              hint: 'Enter Your Clinic',
              icon: Icons.local_hospital,
              controller: clinicController,
            ),
            const SizedBox(height: 15),
            buildInputField(
              label: 'ID',
              hint: 'Enter Your ID Number',
              icon: Icons.badge,
              controller: idController,
            ),
            const SizedBox(height: 15),
            buildInputField(
              label: 'Acadimic Year',
              hint: 'Enter Your Acadimic Year',
              icon: Icons.calendar_today,
              controller: academicYearController,
            ),
            const SizedBox(height: 15),
            buildInputField(
              label: 'Phone',
              hint: 'Enter Your Phone',
              icon: Icons.phone_iphone,
              controller: phoneController,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final clinic = clinicController.text;
                final id = idController.text;
                final academicYear = academicYearController.text;
                final phone = phoneController.text;

                // التنقل لـ HomeScreen مع تمرير البيانات
                Navigator.pushNamed(
                  context,
                  '/home_stu', // تعديل المسار ليطابق main.dart
                  arguments: {
                    'userName': widget.userName,
                    'userEmail': widget.userEmail,
                    'clinic': clinic,
                    'id': id,
                    'academicYear': academicYear,
                    'phone': phone,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F5382),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Save & Continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1F5382),
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.grey[400],
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xFF1F5382),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
