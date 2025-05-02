import 'package:flutter/material.dart';
import 'confirmaion.dart';

class HealthHistoryScreen extends StatefulWidget {
  const HealthHistoryScreen({super.key});

  @override
  State<HealthHistoryScreen> createState() => _HealthHistoryScreenState();
}

class _HealthHistoryScreenState extends State<HealthHistoryScreen> {

  bool heartDisease = false;
  bool liverDisease = false;
  bool renalDisease = false;
  bool rheumaticFever = false;
  bool hypertension = false;
  bool diabetes = false;
  bool stroke = false;
  bool radiotherapy = false;


  List<String> _getSelectedDiseases() {
    List<String> selectedDiseases = [];
    if (heartDisease) selectedDiseases.add("Heart disease");
    if (liverDisease) selectedDiseases.add("Liver disease");
    if (renalDisease) selectedDiseases.add("Renal disease");
    if (rheumaticFever) selectedDiseases.add("Rheumatic fever");
    if (hypertension) selectedDiseases.add("Hypertension");
    if (diabetes) selectedDiseases.add("Diabetes");
    if (stroke) selectedDiseases.add("Stroke");
    if (radiotherapy) selectedDiseases.add("Radiotherapy");
    return selectedDiseases;
  }

 
  bool _validateData() {
   
    List<String> selectedDiseases = _getSelectedDiseases();
    return selectedDiseases.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Health History",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F5382),
                  ),
                ),
              ),
              const SizedBox(height: 30), 
              const Text(
                "Select Your Disease ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F5382),
                ),
              ),
              const SizedBox(height: 10),
              _buildCheckbox("Heart disease", heartDisease, (value) {
                setState(() {
                  heartDisease = value!;
                });
              }),
              _buildCheckbox("Liver disease", liverDisease, (value) {
                setState(() {
                  liverDisease = value!;
                });
              }),
              _buildCheckbox("Renal disease", renalDisease, (value) {
                setState(() {
                  renalDisease = value!;
                });
              }),
              _buildCheckbox("Rheumatic fever", rheumaticFever, (value) {
                setState(() {
                  rheumaticFever = value!;
                });
              }),
              _buildCheckbox("Hypertension", hypertension, (value) {
                setState(() {
                  hypertension = value!;
                });
              }),
              _buildCheckbox("Diabetes", diabetes, (value) {
                setState(() {
                  diabetes = value!;
                });
              }),
              _buildCheckbox("Stroke", stroke, (value) {
                setState(() {
                  stroke = value!;
                });
              }),
              _buildCheckbox("Radiotherapy", radiotherapy, (value) {
                setState(() {
                  radiotherapy = value!;
                });
              }),
              const SizedBox(height: 40), 
              ElevatedButton(
                onPressed: () {
                  if (_validateData()) {
           
                    List<String> selectedDiseases = _getSelectedDiseases();
                    String message = "Selected Diseases: ${selectedDiseases.join(", ")}";

                   
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(message)),
                    );

                  
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ConfirmationScreen()),
                    );
                  } else {
                 
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please select at least one disease.",
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F5382),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, Function(bool?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: Color(0xFF1F5382),
            checkColor: Colors.white,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1F5382),
            ),
          ),
        ],
      ),
    );
  }
}