import 'package:flutter/material.dart';
import 'upload.dart';
import 'health_history.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String gender = "";
  String bookingType = "Normal";
  bool brushTeeth = false;
  bool smoke = false;
  int timesBrushing = 0;
  int cigarettesPerDay = 0;

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
          'Registration',
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
            const SizedBox(height: 20),
            _buildLabeledTextField("Full Name *", "Enter Your Name", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("Phone Number *", "Enter Your Phone", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("National ID *", "Enter Your National ID Number", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("Age *", "Enter Your Age", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("Address", "Enter Your Address"),
            const SizedBox(height: 20),
            _buildTitle("Select your Gender *"),
            Row(
              children: [
                _buildRadioButton("Male", "Male", group: "gender"),
                const SizedBox(width: 8),
                _buildRadioButton("Female", "Female", group: "gender"),
              ],
            ),
            const SizedBox(height: 20),
            _buildTitle("Select your Booking *"),
            Row(
              children: [
                _buildRadioButton("Normal", "Normal", group: "booking"),
                const SizedBox(width: 8),
                _buildRadioButton("VIP", "VIP", group: "booking"),
              ],
            ),
            const SizedBox(height: 20),
            _buildTitle("Do you brush your teeth?"),
            Row(
              children: [
                _buildCheckbox("Yes", true, isBrushing: true),
                const SizedBox(width: 8),
                _buildCheckbox("No", false, isBrushing: true),
              ],
            ),
            const SizedBox(height: 20),
            _buildCounter("How many times a day?", timesBrushing, (val) {
              setState(() {
                timesBrushing = val;
              });
            }),
            const SizedBox(height: 20),
            _buildTitle("Do you smoke?"),
            Row(
              children: [
                _buildCheckbox("Yes", true, isSmoking: true),
                const SizedBox(width: 8),
                _buildCheckbox("No", false, isSmoking: true),
              ],
            ),
            const SizedBox(height: 20),
            _buildCounter("How many cigarettes a day?", cigarettesPerDay, (val) {
              setState(() {
                cigarettesPerDay = val;
              });
            }),
            const SizedBox(height: 20),
            _buildUploadField("Upload", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadScreen()));
            }),
            const SizedBox(height: 20),
            _buildButton("Next", customBlue, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HealthHistoryScreen()));
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

  Widget _buildLabeledTextField(String label, String hint, {bool isRequired = false}) {
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
                  " *",
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String label, String value, {required String group}) {
    bool isSelected = (group == "gender" && gender == value) || (group == "booking" && bookingType == value);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (group == "gender") {
              gender = value;
            } else {
              bookingType = value;
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
                groupValue: group == "gender" ? gender : bookingType,
                onChanged: (String? newValue) {
                  setState(() {
                    if (group == "gender") {
                      gender = newValue!;
                    } else {
                      bookingType = newValue!;
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

  Widget _buildCheckbox(String label, bool value,
      {bool isSmoking = false, bool isBrushing = false}) {
    bool isSelected =
        (isSmoking && smoke == value) || (isBrushing && brushTeeth == value);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSmoking) {
              smoke = value;
            } else if (isBrushing) {
              brushTeeth = value;
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
                      smoke = newValue!;
                    } else if (isBrushing) {
                      brushTeeth = newValue!;
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
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: customBlue),
            ),
          ),
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
                Text(
                  count.toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
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

  Widget _buildUploadField(String hint, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_file, color: Colors.grey),
            const SizedBox(width: 10),
            Text(hint, style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
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
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}