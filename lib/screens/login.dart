import 'package:flutter/material.dart';

import 'choose_for_patient.dart';
import 'welcome.dart';

class LoginScreen extends StatelessWidget {
  // إضافة TextEditingController 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Image.asset('assets/images/pana.png', height: 150),
                SizedBox(height: 20),
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  "Login ",
                  style: TextStyle(fontSize: 24, color: Color(0xFF1F5382)),
                ),
                SizedBox(height: 20),
              
                Align(
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
                SizedBox(height: 8),
                TextField(
                  controller: _emailController, 
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Color(0xFF1F5382)),
                    hintText: "Enter Your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 248, 248),
                  ),
                ),
                SizedBox(height: 12),
                // نص "Password" فوق الحقل
                Align(
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
                SizedBox(height: 8),
                TextField(
                  controller: _passwordController, 
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF1F5382)),
                    hintText: "Enter Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 252, 252, 252),
                  ),
                ),
                SizedBox(height: 8),
                
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xFF1F5382)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseForPatientScreen(
                                    userName: '',
                                    userEmail: '',
                                  )),
                        );
                      } else {
                    
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please enter email and password"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F5382),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 250, 250, 250)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: Color(0xFF1F5382))),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/choose_role');
                      },
                      child: Text(
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
              icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382), size: 30),
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