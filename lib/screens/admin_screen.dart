import 'package:flutter/material.dart';
import 'add_clinic_screen.dart';
import 'add_admin_screen.dart';

// كلاس بسيط لتمثيل العيادة
class Clinic {
  final String name;
  Clinic(this.name);
}

// كلاس بسيط لتمثيل الـ Admin
class Admin {
  final String name;
  Admin(this.name);
}

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Mock lists لتخزين العيادات والـ Admins
  final List<Clinic> clinics = [
    Clinic("Cleaning"),
    Clinic("Filling Clinic"),
    Clinic("Surgery Clinic"),
  ];
  final List<Admin> admins = [
    Admin("Ahmed"),
    Admin("Nagwa"),
  ];

  // دالة لحذف Admin
  void _deleteAdmin(int index) {
    setState(() {
      admins.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA), // لون الخلفية زي Figma
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // قسم العيادات
            const Text(
              "Clinics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F5382),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: clinics.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8ECEF), // لون العنصر زي Figma
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      clinics[index].name,
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // زر Add Clinic تحت قايمة Clinics
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddClinicScreen(
                        onAddClinic: (clinicName) {
                          setState(() {
                            clinics.add(Clinic(clinicName));
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F5382),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  "Add Clinic",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // قسم الـ Admins
            const Text(
              "Admins",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F5382),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: admins.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8ECEF), // لون العنصر زي Figma
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          admins[index].name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black, // لون الأيقونة زي Figma
                          ),
                          onPressed: () {
                            _deleteAdmin(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // زر Add Admin تحت قايمة Admins
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAdminScreen(
                        onAddAdmin: (adminName) {
                          setState(() {
                            admins.add(Admin(adminName));
                          });
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F5382),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  "Add Admin",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}