import 'package:flutter/material.dart';

class DiagnoseOneScreen extends StatefulWidget {
  const DiagnoseOneScreen({super.key});

  @override
  State<DiagnoseOneScreen> createState() => _DiagnoseOneScreenState();
}

class _DiagnoseOneScreenState extends State<DiagnoseOneScreen> {
  String gender = 'Female';
  String booking = 'VIP';
  String brushTeeth = 'Yes';
  String smoke = 'No';
  String complaint = 'Tooth decay';
  int timesDay = 2;
  int cigarettesPerDay = 0;
  List<String> patientDisease = ['Liver disease'];

  List<String> complaints = [
    'Tooth decay',
    'Gum disease',
    'Sensitivity',
    'Bad breath',
  ];

  List<String> diseases = [
    'Heart disease',
    'Liver disease',
    'Renal disease',
    'Rheumatic fever',
    'Hypertension',
    'Diabetes',
    'Stroke',
    'Radiotherapy',
  ];

  final Color customBlue = const Color(0xFF1F5382);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Diagnose one',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F5382),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabeledTextField('Name', 'Nagwa Ahmed Zaki',
                isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField('Phone', '01113829537', isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField('National ID Number', '3030329220072',
                isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField('Age', '22', isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField('Adress', 'Enter Your Adress'),
            const SizedBox(height: 20),
            _buildTitle('Select your Gender *'),
            Row(
              children: [
                _buildRadioButton('Male', 'Male', group: 'gender'),
                const SizedBox(width: 8),
                _buildRadioButton('Female', 'Female', group: 'gender'),
              ],
            ),
            const SizedBox(height: 20),
            _buildTitle('Choose your complaint'),
            _buildDropdown(complaint, complaints, (val) {
              setState(() {
                complaint = val!;
              });
            }),
            const SizedBox(height: 20),
            _buildTitle('Select your Booking *'),
            Row(
              children: [
                _buildRadioButton('Normal', 'Normal', group: 'booking'),
                const SizedBox(width: 8),
                _buildRadioButton('VIP', 'VIP', group: 'booking'),
              ],
            ),
            const SizedBox(height: 20),
            _buildTitle('Do you brush your teeth?'),
            Row(
              children: [
                _buildCheckbox('Yes', 'Yes', isBrushing: true),
                const SizedBox(width: 8),
                _buildCheckbox('No', 'No', isBrushing: true),
              ],
            ),
            const SizedBox(height: 20),
            _buildCounter('How many times a day?', timesDay, (val) {
              setState(() {
                timesDay = val;
              });
            }),
            const SizedBox(height: 20),
            _buildTitle('Do you smoke?'),
            Row(
              children: [
                _buildCheckbox('Yes', 'Yes', isSmoking: true),
                const SizedBox(width: 8),
                _buildCheckbox('No', 'No', isSmoking: true),
              ],
            ),
            const SizedBox(height: 20),
            _buildCounter('How many cigarettes a day?', cigarettesPerDay,
                (val) {
              setState(() {
                cigarettesPerDay = val;
              });
            }),
            const SizedBox(height: 20),
            _buildTitle('Patient Disease'),
            const SizedBox(height: 8),
            ...diseases.map(
              (disease) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.medical_services_outlined,
                      color: customBlue,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                        child: Text(disease,
                            style: const TextStyle(fontSize: 14))),
                    Checkbox(
                      value: patientDisease.contains(disease),
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            patientDisease.add(disease);
                          } else {
                            patientDisease.remove(disease);
                          }
                        });
                      },
                      activeColor: customBlue,
                      checkColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildButton('Diagnose two', customBlue, () {
              Navigator.pushNamed(context, '/diagnose_two');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1F5382),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, String hint,
      {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F5382),
                ),
              ),
              if (isRequired)
                const Text(
                  ' *',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String label, String value,
      {required String group}) {
    bool isSelected = (group == 'gender' && gender == value) ||
        (group == 'booking' && booking == value);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (group == 'gender') {
              gender = value;
            } else {
              booking = value;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: customBlue),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? customBlue : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                value: value,
                groupValue: group == 'gender' ? gender : booking,
                onChanged: (String? newValue) {
                  setState(() {
                    if (group == 'gender') {
                      gender = newValue!;
                    } else {
                      booking = newValue!;
                    }
                  });
                },
                activeColor: isSelected ? Colors.white : customBlue,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return customBlue;
                }),
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : customBlue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, String value,
      {bool isSmoking = false, bool isBrushing = false}) {
    bool isSelected =
        (isSmoking && smoke == value) || (isBrushing && brushTeeth == value);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSmoking) {
              smoke = value == 'Yes' ? 'Yes' : 'No';
            } else if (isBrushing) {
              brushTeeth = value == 'Yes' ? 'Yes' : 'No';
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: customBlue),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? customBlue : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (bool? newValue) {
                  setState(() {
                    if (isSmoking) {
                      smoke = newValue! ? 'Yes' : 'No';
                    } else if (isBrushing) {
                      brushTeeth = newValue! ? 'Yes' : 'No';
                    }
                  });
                },
                activeColor: customBlue,
                checkColor: Colors.white,
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : customBlue,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(String label, int count, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(label,
                  style: TextStyle(fontSize: 16, color: customBlue))),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: customBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: customBlue,
                  onPressed: () {
                    if (count > 0) {
                      onChanged(count - 1);
                    }
                  },
                ),
                Text(count.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: customBlue,
                  onPressed: () {
                    onChanged(count + 1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String value,
      List<String> items,
      void Function(String?)? onChanged,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              underline: Container(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              items: items
                  .map((e) =>
                  DropdownMenuItem(value: e,
                      child: Text(e, style: const TextStyle(
                          color: Colors.black, fontSize: 14))))
                  .toList(),
              onChanged: onChanged,
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              iconEnabledColor: customBlue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child:
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}