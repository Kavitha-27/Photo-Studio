import 'package:frontend/edit_shop.dart';
import 'package:frontend/palatte.dart';
import 'widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/background.dart';
import 'package:frontend/widgets/roundedbutton.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  void _saveProfile() {
    String shopName = shopNameController.text;
    String contact = contactController.text;

    // For now just print the values or use a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saved: $shopName, $contact'),
        backgroundColor: Colors.green,
      ),
    );

    // You can save this data to backend or local storage as needed
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          controller: shopNameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.store, color: Colors.white),
                            hintText: 'Shop Name',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: contactController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone, color: Colors.white),
                            hintText: 'Contact Number',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 60),
                        RoundedButton(
                          buttonText: 'Save',
                          onPressed: _saveProfile,
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
}

// shop_profile.dart
class ShopProfile {
  final String shopName;
  final String contact;

  ShopProfile({required this.shopName, required this.contact});

  factory ShopProfile.fromJson(Map<String, dynamic> json) {
    return ShopProfile(
      shopName: json['shop_name'],
      contact: json['contact'],
    );
  }
}
