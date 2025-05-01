import 'package:flutter/material.dart';

import 'case_details.dart';

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

  late List<bool> isCompleted;

  final Color primaryColor = const Color(0xFF1F5382);
  final Color hintGray = const Color(0xFFBDBDBD);

  @override
  void initState() {
    super.initState();
    isCompleted = List<bool>.filled(patients.length, false);
  }

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                  'You have new cases !',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 100),
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 6,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/details_icn.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              patients[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: isCompleted[index],
                            onChanged: (bool? value) {
                              setState(() {
                                isCompleted[index] = value ?? false;
                              });
                            },
                            activeColor: primaryColor,
                            // Blue color when checked
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: const BorderSide(
                              color: Color(0xFF1F5382),
                              // Border color when unchecked
                              width: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 35),
                  itemCount: patients.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}