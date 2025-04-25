import 'package:flutter/material.dart';
import 'account_cons.dart';
import 'account_patient.dart';
import 'account_doc.dart';

class SettingsScreen extends StatefulWidget {
  final String role;
  final String userName;
  final String userEmail;
  final String? academicYear;
  final String? phone;
  final String? clinic;
  final String? id;

  const SettingsScreen({
    super.key,
    required this.role,
    required this.userName,
    required this.userEmail,
    this.academicYear,
    this.phone,
    this.clinic,
    this.id,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isNotificationEnabled = true;
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF1F5382),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingItem(
              icon: Icons.notifications,
              title: "Notification",
              hasSwitch: true,
              switchValue: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.dark_mode,
              title: "Dark Mode",
              hasSwitch: true,
              switchValue: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.account_circle,
              title: "Account",
              onTap: () {
                if (widget.role == 'Doctor') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountDoctorScreen(
                        role: widget.role,
                        userName: widget.userName,
                        userEmail: widget.userEmail,
                        academicYear: widget.academicYear,
                        phone: widget.phone,
                        clinic: widget.clinic,
                        id: widget.id,
                      ),
                    ),
                  );
                } else if (widget.role == 'Patient') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountPatientScreen(
                        role: widget.role,
                        userName: widget.userName,
                        userEmail: widget.userEmail,
                        phone: widget.phone, // جديد: تمرير الـ phone
                      ),
                    ),
                  );
                } else if (widget.role == 'Consultant') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AccountConsultantScreen(
                        role: widget.role,
                        userName: widget.userName,
                        userEmail: widget.userEmail,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    bool hasSwitch = false,
    bool switchValue = false,
    Function(bool)? onChanged,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: const Color(0xFF1F5382)),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1F5382),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            if (hasSwitch)
              Switch(
                value: switchValue,
                onChanged: onChanged,
                activeColor: const Color(0xFF1F5382),
              ),
          ],
        ),
      ),
    );
  }
}