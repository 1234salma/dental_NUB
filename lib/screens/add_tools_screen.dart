import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddToolsScreen extends StatefulWidget {
  final Function(Map<String, String>) onAddProduct;

  const AddToolsScreen({super.key, required this.onAddProduct});

  @override
  _AddToolsScreenState createState() => _AddToolsScreenState();
}

class _AddToolsScreenState extends State<AddToolsScreen> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController desc1Controller = TextEditingController();
  final TextEditingController desc2Controller = TextEditingController();

  final Color mainBlue = Color(0xFF1F5382); // اللون الأساسي للأزرق

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _handleNext() {
    if (_image != null &&
        desc1Controller.text.isNotEmpty &&
        desc2Controller.text.isNotEmpty) {
      widget.onAddProduct({
        "image": _image!.path,
        "title": desc1Controller.text,
        "price": desc2Controller.text,
        "isNew": "false",
        "description": desc1Controller.text,
        "brand": "User",
      });

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields and upload image")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: mainBlue),
        title: Text(
          "Add your tools",
          style: TextStyle(color: mainBlue, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 12),
            Text(
              "Upload your product",
              style: TextStyle(fontSize: 16, color: mainBlue),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                foregroundColor: mainBlue,
                backgroundColor: Colors.white,
                side: BorderSide(color: mainBlue),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(120, 40),
              ),
              child: Text("Upload"),
            ),
            if (_image != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Image.file(_image!, height: 120),
              ),
            SizedBox(height: 12),
            _buildTextField("Enter your description", desc1Controller),
            SizedBox(height: 24),
            _buildTextField("Enter your description", desc2Controller),
            SizedBox(height: 36),
            ElevatedButton(
              onPressed: _handleNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: mainBlue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: mainBlue)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter Your Description",
            hintStyle: TextStyle(color: Colors.grey[400]),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
        ),
      ],
    );
  }
}
