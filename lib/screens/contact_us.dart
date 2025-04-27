import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'community_store.dart'; // استيراد شاشة CommunityStore

class ContactUSScreen extends StatelessWidget {
  final TextEditingController idController =
      TextEditingController(text: "1000");
  final TextEditingController nameController =
      TextEditingController(text: "Merna");
  final TextEditingController phoneController = TextEditingController();

  // شيلنا 'const' من الـ constructor
  ContactUSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF376D9F)),
          onPressed: () {
            // الرجوع إلى شاشة CommunityStore
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const CommunityStore()),
              (route) => false, // إزالة كل الشاشات السابقة
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Contact US',
              style: TextStyle(
                color: Color(0xFF376D9F),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF376D9F).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildRow(Icons.attach_money, idController),
                  const SizedBox(height: 15),
                  buildRow(Icons.person_outline, nameController),
                  const SizedBox(height: 15),
                  buildRow(Icons.smartphone, phoneController),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (idController.text.isNotEmpty) {
                        Clipboard.setData(
                            ClipboardData(text: idController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Phone number copied!')),
                        );
                      }
                    },
                    child: Text(
                      "Press here to copy phone",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (idController.text.isNotEmpty) {
                        Clipboard.setData(
                            ClipboardData(text: idController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Phone number copied!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                          color: Color(0xFF376D9F), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                    ),
                    child: const Text(
                      "Copy",
                      style: TextStyle(
                        color: Color(0xFF376D9F),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(IconData icon, TextEditingController controller) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            icon,
            color: const Color(0xFF376D9F),
            size: 25,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            enabled: false,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Color(0xFF376D9F), width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    const BorderSide(color: Color(0xFF376D9F), width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}