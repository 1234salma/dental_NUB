import 'package:flutter/material.dart';
import 'welcome.dart';
import 'choose_for_patient.dart';
import 'admin_screen.dart'; // هنضيف الملف ده بعدين

class LoginScreen extends StatelessWidget {
  // إضافة TextEditingController
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Mock credentials للـ Admin
  final String adminEmail = "admin@example.com";
  final String adminPassword = "admin123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/pana.png', height: 150),
                const SizedBox(height: 20),
                const Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Login ",
                  style: TextStyle(fontSize: 24, color: Color(0xFF1F5382)),
                ),
                const SizedBox(height: 20),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1F5382),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Color(0xFF1F5382)),
                    hintText: "Enter Your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 248, 248),
                  ),
                ),
                const SizedBox(height: 12),
                // نص "Password" فوق الحقل
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1F5382),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF1F5382)),
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    filled: true,
                    fillColor: Color.fromARGB(255, 252, 252, 252),
                  ),
                ),
                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFF1F5382)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        // التحقق من بيانات الـ Admin
                        if (_emailController.text == adminEmail &&
                            _passwordController.text == adminPassword) {
                          // لو Admin، يروح لشاشة الـ Admin
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminScreen()),
                          );
                        } else {
                          // لو مش Admin، يروح لشاشة المستخدم العادي
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChooseForPatientScreen(
                                      userName: '',
                                      userEmail: '',
                                    )),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter email and password"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1F5382),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 250, 250, 250)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?",
                        style: TextStyle(color: Color(0xFF1F5382))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/choose_role');
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xFF1F5382),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xFF1F5382), size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
