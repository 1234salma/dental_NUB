import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String? academicYear;
  final String? phone;
  final String? clinic;
  final String? id;

  const EditProfileScreen({
    super.key,
    required this.userName,
    required this.userEmail,
    this.academicYear,
    this.phone,
    this.clinic,
    this.id,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _academicYearController;
  late TextEditingController _phoneController;
  late TextEditingController _clinicController;
  late TextEditingController _idController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.userName);
    _emailController = TextEditingController(text: widget.userEmail);
    _academicYearController = TextEditingController(text: widget.academicYear);
    _phoneController = TextEditingController(text: widget.phone);
    _clinicController = TextEditingController(text: widget.clinic);
    _idController = TextEditingController(text: widget.id);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _academicYearController.dispose();
    _phoneController.dispose();
    _clinicController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Color(0xFF1F5382)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(
                controller: _nameController,
                icon: Icons.person,
                label: 'Name',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _idController,
                icon: Icons.badge,
                label: 'ID',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _emailController,
                icon: Icons.email,
                label: 'Email',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _academicYearController,
                icon: Icons.school,
                label: 'Academic Year',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _phoneController,
                icon: Icons.phone,
                label: 'Phone',
              ),
              const SizedBox(height: 10),
              _buildTextField(
                controller: _clinicController,
                icon: Icons.local_hospital,
                label: 'Clinic',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // نرجّع القيم المحدّثة للـ AccountDoctorScreen
                    Navigator.pop(context, {
                      'userName': _nameController.text,
                      'userEmail': _emailController.text,
                      'academicYear': _academicYearController.text.isEmpty ? null : _academicYearController.text,
                      'phone': _phoneController.text.isEmpty ? null : _phoneController.text,
                      'clinic': _clinicController.text.isEmpty ? null : _clinicController.text,
                      'id': _idController.text.isEmpty ? null : _idController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F5382),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF1F5382)),
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF1F5382)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F5382)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F5382)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F5382)),
        ),
      ),
    );
  }
}