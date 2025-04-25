import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F5382),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context), // يرجع للشاشة السابقة
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            children: [
              Image.asset('assets/images/logo.png', height: 100),
              const SizedBox(height: 10),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            height: 300,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Sign up as a ?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A4D80),
                  ),
                ),
                const SizedBox(height: 20),
                _buildRoleButton(context, 'Consultant'),
                const SizedBox(height: 15),
                _buildRoleButton(context, 'Patient'),
                const SizedBox(height: 15),
                _buildRoleButton(context, 'Doctor'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(BuildContext context, String role) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/sign_up',
              arguments: {'role': role},
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF0A4D80), width: 1),
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
          ),
          child: Text(
            role,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0A4D80),
            ),
          ),
        ),
      ),
    );
  }
}