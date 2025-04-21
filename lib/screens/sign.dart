import 'package:flutter/material.dart';
import 'choose_for_patient.dart';
import 'login.dart';
import 'choose_for_doctor.dart'; // استيراد شاشة الـ Consultant

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String role = arguments?['role'] ?? 'Patient'; // الدور اللي جاي من ChooseRoleScreen

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF1F5382),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.person, "Enter Your Name", controller: _nameController),
                      const SizedBox(height: 20),
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.email, "Enter Your email address", controller: _emailController),
                      const SizedBox(height: 20),
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.lock, "Enter Your password", obscureText: true, controller: _passwordController),
                      const SizedBox(height: 20),
                      Text(
                        "Confirm password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.lock, "Enter Your password", obscureText: true, controller: _confirmPasswordController),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // التأكد من تطابق كلمات المرور
                            if (_passwordController.text != _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Passwords do not match")),
                              );
                              return;
                            }
                            // جمع البيانات
                            final String name = _nameController.text;
                            final String email = _emailController.text;

                            // التنقل بناءً على الدور مع تمرير البيانات
                            if (role == 'Consultant') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorHomeView(
                                    userName: name,
                                    userEmail: email,
                                  ),
                                ),
                              );
                            } else if (role == 'Patient') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseForPatientScreen(
                                    userName: name,
                                    userEmail: email,
                                  ),
                                ),
                              );
                            } else if (role == 'Doctor') {
                              // تنقل مؤقت لأن شاشة الـ Doctor مش متوفرة حاليًا
                              Navigator.pushNamed(context, '/doctor_home_view');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F5382),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            "Save & Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F5382),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, {bool obscureText = false, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F5382)),
        ),
      ),
    );
  }
}