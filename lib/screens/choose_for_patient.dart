import 'package:flutter/material.dart';
import 'registration.dart';
import 'chat.dart';
import 'settings_screen.dart';

class ChooseForPatientScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ChooseForPatientScreen({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1F5382),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/Angela.png'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi $userName",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  userEmail,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: screenHeight * 0.15,
                ),
                const SizedBox(height: 15),
                _buildCustomButton(
                  context,
                  'Take Appointment',
                  screenWidth * 0.35,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistrationScreen()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(width: 15),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/cuate.png',
                  height: screenHeight * 0.15,
                ),
                const SizedBox(height: 15),
                _buildCustomButton(
                  context,
                  'ASK Chat NUB',
                  screenWidth * 0.35,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(BuildContext context, String text, double width, VoidCallback onPressed) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1F5382),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}