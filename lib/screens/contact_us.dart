import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ContactUS());
}

class ContactUS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactUSScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactUSScreen extends StatelessWidget {
  final TextEditingController idController =
      TextEditingController(text: "1000");
  final TextEditingController nameController =
      TextEditingController(text: "Merna");
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء
      appBar: AppBar(
        leading: BackButton(color: Color(0xFF376D9F)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Contact US',
              style: TextStyle(
                color: Color(0xFF376D9F),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30), // زيادة المسافة بين النص والكونتينر
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF376D9F).withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildRow(Icons.attach_money, idController), // أيقونة فلوس
                  SizedBox(height: 15),
                  buildRow(Icons.person_outline, nameController), // أيقونة شخص
                  SizedBox(height: 15),
                  buildRow(Icons.smartphone, phoneController), // أيقونة موبايل
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      if (idController.text.isNotEmpty) {
                        Clipboard.setData(
                            ClipboardData(text: idController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Phone number copied!')),
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
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (idController.text.isNotEmpty) {
                        Clipboard.setData(
                            ClipboardData(text: idController.text));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Phone number copied!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xFF376D9F), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12), // زيادة عرض الزر
                    ),
                    child: Text(
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
            color: Color(0xFF376D9F),
            size: 25,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            enabled: false,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black54, // لون النص زي الصورة
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF376D9F), width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color(0xFF376D9F), width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
