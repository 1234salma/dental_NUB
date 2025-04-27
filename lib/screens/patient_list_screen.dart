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
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, //
        appBar: AppBar(
          backgroundColor: Colors.transparent, //
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'You have new cases !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 100),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PatientDetailsScreen(
                            patient: patients[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 52,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 6,
                            offset: Offset(1, 1),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/details_icn.png",
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            patients[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 35),
                  itemCount: patients.length,
                ),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.only(top: 180.0, left: 16.0, right: 16.0), //
              //   child: Expanded(
              //     child: ListView.builder(
              //       itemCount: patients.length,
              //       itemBuilder: (context, index) {
              //         final patient = patients[index];
              //         return Padding(
              //           padding: const EdgeInsets.symmetric(vertical: 12.0), //
              //           child: ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //               backgroundColor: Colors.white,
              //               //
              //               side: BorderSide(color: primaryColor, width: 1.5),
              //               //
              //               shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(50), //
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                 vertical: 16,
              //                 horizontal: 16,
              //               ),
              //               elevation: 0,
              //             ),
              //             onPressed: () {
              //               //
              //               Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) =>
              //                       PatientDetailsScreen(patient: patient),
              //                 ),
              //               );
              //             },
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   Icons.add_box_outlined, //
              //                   color: primaryColor,
              //                   size: 24,
              //                 ),
              //                 SizedBox(width: 10),
              //                 Text(
              //                   patient,
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
