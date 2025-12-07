import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/background.dart';
import 'package:frontend/widgets/roundedbutton.dart';

class UploadImagePage extends StatefulWidget {
  const UploadImagePage({super.key});

  @override
  State<UploadImagePage> createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _uploadImage() {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
      return;
    }

    // TODO: Add actual upload logic here (e.g., upload to Firebase or server)

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image uploaded successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Upload Image', style: kHeading.copyWith(fontSize: 20)),
            centerTitle: true,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _selectedImage != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(_selectedImage!),
                          radius: 70,
                        )
                      : const CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                          radius: 70,
                        ),
                  const SizedBox(height: 30),
                  RoundedButton(
                    buttonText: 'Pick from Gallery',
                    onPressed: () => _pickImage(ImageSource.gallery),
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    buttonText: 'Take a Photo',
                    onPressed: () => _pickImage(ImageSource.camera),
                  ),
                  const SizedBox(height: 20),
                  RoundedButton(
                    buttonText: 'Upload',
                    onPressed: _uploadImage,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
