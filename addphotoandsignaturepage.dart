import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:signature/signature.dart';

class AddPhotoAndSignaturePage extends StatefulWidget {
  const AddPhotoAndSignaturePage({Key? key}) : super(key: key);

  @override
  State<AddPhotoAndSignaturePage> createState() =>
      _AddPhotoAndSignaturePageState();
}

class _AddPhotoAndSignaturePageState extends State<AddPhotoAndSignaturePage> {
  XFile? _image;
  final SignatureController _signatureController = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.white,
  );

  /// Function to pick an image from the gallery
  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage =
          await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = pickedImage;
        });
        print("Image selected: ${_image!.path}");
      }
    } catch (e) {
      print("Error picking image: $e");
      _showSnackBar("Failed to pick image.");
    }
  }

  /// Function to clear the signature
  void _clearSignature() {
    _signatureController.clear();
  }

  /// Function to validate and save the photo and signature
  void _validateAndSave() {
    if (_image == null) {
      _showSnackBar("Please select a photo.");
    } else if (_signatureController.isEmpty) {
      _showSnackBar("Please add your signature.");
    } else {
      _showSnackBar("Photo and signature saved successfully!");
    }
  }

  /// Function to show snack bars
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isWideScreen = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFAD9CD0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Photo & Signature',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader("Add your photo and signature", isWideScreen),
            SizedBox(height: screenHeight * 0.02),
            _buildImagePicker(),
            SizedBox(height: screenHeight * 0.05),
            _buildHeader("Draw your signature", isWideScreen),
            SizedBox(height: screenHeight * 0.02),
            _buildSignaturePad(isWideScreen, screenHeight),
            SizedBox(height: screenHeight * 0.02),
            _buildClearButton(isWideScreen),
            SizedBox(height: screenHeight * 0.05),
            _buildGenerateResumeButton(isWideScreen, screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  /// Builds the section header
  Widget _buildHeader(String text, bool isWideScreen) {
    return Text(
      text,
      style: TextStyle(
        fontSize: isWideScreen ? 20 : 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  /// Builds the image picker section
  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          image: _image != null
              ? DecorationImage(
                  image: FileImage(File(_image!.path)),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: _image == null
            ? const Center(
                child: Icon(Icons.camera_alt, size: 50, color: Colors.black),
              )
            : null,
      ),
    );
  }

  /// Builds the signature pad
  Widget _buildSignaturePad(bool isWideScreen, double screenHeight) {
    return Container(
      height: isWideScreen ? screenHeight * 0.3 : screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Signature(
        controller: _signatureController,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  /// Builds the clear signature button
  Widget _buildClearButton(bool isWideScreen) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _clearSignature,
        child: Text(
          'Clear Signature',
          style: TextStyle(
            fontSize: isWideScreen ? 16 : 14,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  /// Builds the "Generate Resume" button
  Widget _buildGenerateResumeButton(
      bool isWideScreen, double screenWidth, double screenHeight) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: _validateAndSave,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.1,
            vertical: screenHeight * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Generate Resume',
          style: TextStyle(
            fontSize: isWideScreen ? 16 : 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
