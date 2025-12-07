import 'package:flutter/material.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/background.dart';
import 'package:frontend/edit_shop.dart';
import 'package:frontend/widgets/roundedbutton.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  // Sample data (replace with dynamic data)
  final String shopName = "My Photo Studio";
  final String contactNumber = "+91 9876543210";
  final int numberOfPhotos = 120;

//   final String shopName = shopData.name;
// final String contactNumber = shopData.contact;
// final int numberOfPhotos = shopData.photoCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    'Shop Profile',
                    style: kHeading.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfileField(Icons.store, 'Shop Name', shopName),
                        const SizedBox(height: 20),
                        _buildProfileField(
                            Icons.phone, 'Contact Number', contactNumber),
                        const SizedBox(height: 20),
                        _buildProfileField(Icons.photo, 'Number of Photos',
                            numberOfPhotos.toString()),
                        const SizedBox(height: 60),
                        Center(
                          child: RoundedButton(
                            buttonText: 'Edit Profile',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditShopPage()),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileField(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white54, fontSize: 12),
            ),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
