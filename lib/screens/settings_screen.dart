import 'package:flutter/material.dart';
import 'account_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

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
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFF1F5382),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
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
                Icon(icon, color: Color(0xFF1F5382)),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
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
                activeColor: Color(0xFF1F5382),
              ),
          ],
        ),
      ),
    );
  }
}