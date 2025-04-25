import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorProfileScreen(),
    );
  }
}

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        children: [
          SizedBox(height: 60),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://i.imgur.com/BoN9kdC.png', // بدّلها بصورة الطبيب لو عندك
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Doctor Angela',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'Dr.angela@gmail.com',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          SizedBox(height: 30),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  ProfileCard(
                    icon: Icons.person,
                    text: 'Angrla Walym Ahmed',
                  ),
                  SizedBox(height: 15),
                  ProfileCard(
                    icon: Icons.email,
                    text: 'Dr.angela@gmail.com',
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // logout logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Logout", style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileCard({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.blue[900]),
        title: Text(text, style: TextStyle(color: Colors.blue[900])),
      ),
    );
  }
}
