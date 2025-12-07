// profile_fetch_page.dart
import 'package:flutter/material.dart';
import 'fetch_profile.dart'; // API logic
import 'profile_page.dart'; // Your model

class ProfileFetchPage extends StatefulWidget {
  const ProfileFetchPage({super.key});

  @override
  State<ProfileFetchPage> createState() => _ProfileFetchPageState();
}

class _ProfileFetchPageState extends State<ProfileFetchPage> {
  late Future<ShopProfile> futureProfile;

  @override
  void initState() {
    super.initState();
    futureProfile = fetchShopProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop Profile')),
      body: Center(
        child: FutureBuilder<ShopProfile>(
          future: futureProfile,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Shop Name: ${snapshot.data!.shopName}'),
                  Text('Contact: ${snapshot.data!.contact}'),
                ],
              );
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }
}
