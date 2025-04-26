import 'package:flutter/material.dart';
import 'case_details.dart'; //

class MyPatientListScreen extends StatefulWidget {
  const MyPatientListScreen({super.key});

  @override
  _MyPatientListScreenState createState() => _MyPatientListScreenState();
}

class _MyPatientListScreenState extends State<MyPatientListScreen> {
  final List<String> patients = [
    'Nagwa Ahmed Zaki',
    'Salma Mostafa Bakry',
    'Aya Nady Yassien',
  ];

  final Color primaryColor = Color(0xFF1F5382); //
  final Color hintGray = Color(0xFFBDBDBD); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //
      appBar: AppBar(
        backgroundColor: Colors.white, //
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_wave.png.png'),
            fit: BoxFit.cover, //
          ),
        ),
        child: Stack(
          children: [
            //  "You have new cases !"
            Positioned(
              top: 100, //
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'You have new cases !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding:
                  const EdgeInsets.only(top: 180.0, left: 16.0, right: 16.0), //
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  final patient = patients[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0), //
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        //
                        side: BorderSide(color: primaryColor, width: 1.5),
                        //
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), //
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        //
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PatientDetailsScreen(patient: patient),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_outlined, //
                            color: primaryColor,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            patient,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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