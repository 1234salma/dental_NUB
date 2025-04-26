import 'package:flutter/material.dart';

class AddClinicScreen extends StatelessWidget {
  final Function(String) onAddClinic;

  AddClinicScreen({Key? key, required this.onAddClinic}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _maxStudentController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  final TextEditingController _allowedYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // لون الخلفية زي Figma
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50), // مسافة من الأعلى عشان زر الرجوع
                // عنوان Clinic Name
                const Text(
                  "Clinic name",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                ),
                const SizedBox(height: 24), // مسافة بين الحقول زي Figma
                // عنوان Max Student
                const Text(
                  "Max student",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _maxStudentController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24), // مسافة بين الحقول زي Figma
                // عنوان Schedule
                const Text(
                  "Schedule",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _scheduleController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                ),
                const SizedBox(height: 24), // مسافة بين الحقول زي Figma
                // عنوان Allowed Year
                const Text(
                  "Allowed year",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _allowedYearController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 30), // مسافة أكبر بين الحقل الأخير والزر
                SizedBox(
                  width: double.infinity, // الزر بعرض الشاشة
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _maxStudentController.text.isNotEmpty &&
                          _scheduleController.text.isNotEmpty &&
                          _allowedYearController.text.isNotEmpty) {
                        onAddClinic(_nameController.text);
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F5382),
                      padding: const EdgeInsets.symmetric(vertical: 15), // حجم الزر زي Figma
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // زوايا دائرية
                      ),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // زر الرجوع في أعلى اليمين
          Positioned(
            top: 20,
            left: 16,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF1F5382),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context); // رجوع للصفحة السابقة
              },
            ),
          ),
        ],
      ),
    );
  }
}