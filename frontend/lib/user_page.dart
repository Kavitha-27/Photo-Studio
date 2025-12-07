import 'package:flutter/material.dart';
import 'package:frontend/widgets/background.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/roundedbutton.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  // Sample user data (replace with real user data later)
  final String username = "Kavii";
  final String contactNumber = "+91 9876543210";

  void _signOut(BuildContext context) {
    // TODO: Handle actual sign-out logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Signed out"),
        backgroundColor: Colors.red,
      ),
    );

    // Navigate to login or home page
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  'User Profile',
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
                      _buildUserInfo(Icons.person, "Username", username),
                      const SizedBox(height: 20),
                      _buildUserInfo(
                          Icons.phone, "Contact Number", contactNumber),
                      const SizedBox(height: 60),
                      Center(
                        child: RoundedButton(
                          buttonText: "Sign Out",
                          onPressed: () => _signOut(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.white54, fontSize: 12)),
            Text(value,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ],
    );
  }
}
