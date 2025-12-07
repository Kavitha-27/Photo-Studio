import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:frontend/widgets/background.dart';
import 'package:frontend/widgets/roundedbutton.dart';
import 'package:frontend/palatte.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  DateTime? _selectedDate;

  List<Map<String, String>> allUsers = [
    {
      "name": "Kavii",
      "email": "kavii@gmail.com",
      "mobile": "9876543210",
      "date": "2025-04-10"
    },
    {
      "name": "Rahul",
      "email": "rahul@gmail.com",
      "mobile": "9123456780",
      "date": "2025-04-09"
    },
  ];

  List<Map<String, String>> filteredUsers = [];

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _filterUsers() {
    final email = _emailController.text.toLowerCase();
    final mobile = _mobileController.text;
    final dateStr = _selectedDate != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
        : null;

    setState(() {
      filteredUsers = allUsers.where((user) {
        final matchEmail =
            email.isEmpty || user['email']!.toLowerCase().contains(email);
        final matchMobile = mobile.isEmpty || user['mobile']!.contains(mobile);
        final matchDate = dateStr == null || user['date'] == dateStr;
        return matchEmail && matchMobile && matchDate;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(), // Background image
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Dashboard Filter',
                    style: kHeading.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email, color: Colors.white),
                            hintText: 'Email ID',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _mobileController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.phone_android, color: Colors.white),
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.white54),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                _selectedDate == null
                                    ? 'Select Date'
                                    : 'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                                style: const TextStyle(color: Colors.white70),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: _pickDate,
                              child: const Text("Pick Date"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        RoundedButton(
                          buttonText: 'Apply Filter',
                          onPressed: _filterUsers,
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  if (filteredUsers.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Filtered Users:",
                            style: kHeading.copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 20),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              final user = filteredUsers[index];
                              return Card(
                                color: Colors.white70,
                                child: ListTile(
                                  title: Text(user["name"] ?? ""),
                                  subtitle: Text(
                                      "${user['email']} | ${user['mobile']} | ${user['date']}"),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
