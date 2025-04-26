import 'package:flutter/material.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final List<String> patients = [
    'Nagwa Ahmed Zaki',
    'Salma Mostafa Bakry',
    'Aya Nady Yassien',
    'Merna Ali Megahd',
    'Shaimaa Barakat',
    'Hager Ahmed Saeed',
    'Ahmed Yasser',
    'Hazem Bakry',
    'Mostafa Ahmed Ali',
    'Nada Ahmed Ali',
    'Tasneem Yasser',
    'Arwa Zanaty'
  ];
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Patients list',
          style:
              TextStyle(color: Color(0xFF1F5382), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Find a patient',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  if (query.isNotEmpty &&
                      !patient.toLowerCase().contains(query)) {
                    return SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1F5382),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/diagnose_one',
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${index + 1}. $patient',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
