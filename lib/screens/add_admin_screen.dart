import 'package:flutter/material.dart';

class AddAdminScreen extends StatelessWidget {
  final Function(String) onAddAdmin;

  AddAdminScreen({Key? key, required this.onAddAdmin}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                const SizedBox(height: 60), // زيادة المسافة من الأعلى عشان زر الرجوع
                // عنوان Name
                const Text(
                  "Name",
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
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF1F5382), // لون الأيقونة زي الديزاين
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                ),
                const SizedBox(height: 24), // مسافة بين الحقول زي Figma
                // عنوان Email
                const Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFF1F5382), // لون الأيقونة زي الديزاين
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24), // مسافة بين الحقول زي Figma
                // عنوان Password
                const Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xFF8A8A8A), // لون رمادي باهت زي Figma
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: Color(0xFFE8ECEF), // خلفية رمادي فاتح
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF1F5382), // لون الأيقونة زي الديزاين
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)), // زوايا دائرية
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30), // مسافة بين الحقل الأخير والزر
                SizedBox(
                  width: double.infinity, // الزر بعرض الشاشة
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        onAddAdmin(_nameController.text);
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
          // زر الرجوع في أعلى اليسار
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