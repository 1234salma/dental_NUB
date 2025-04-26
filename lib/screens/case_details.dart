import 'package:flutter/material.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patient; //

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_wave.png.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //  //"Hello! These are your case details!"
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hello!\nThese are your case details!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //  (Name, Phone, Age, Chronic Diseases)
            Padding(
              padding:
                  const EdgeInsets.only(top: 150.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      patient, //
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Phone
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      '010260753215',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Age
                  Text(
                    'Age',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      '33',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Chronic Diseases
                  Text(
                    'Chronic Diseases',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      'Stroke', //
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      'Diabetes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  //
                  Center(
                    child: Text(
                      'You can view the diagnose from here',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // زر "View"
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1F5382), //
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'View',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
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
}
