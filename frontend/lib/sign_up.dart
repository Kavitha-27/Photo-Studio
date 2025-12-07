import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/password.dart';
import 'package:frontend/widgets/roundedbutton.dart';
import 'package:frontend/widgets/textinput.dart';
import 'widgets/background.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  Center(
                    child: Text(
                      'Sign Up',
                      style: kHeading.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              icon: FontAwesomeIcons.user,
                              hint: 'Name',
                              inputType: TextInputType.name,
                              inputAction: TextInputAction.next,
                            ),
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Password',
                              inputAction: TextInputAction.next,
                            ),
                            PasswordInput(
                              icon: FontAwesomeIcons.lock,
                              hint: 'Confirm Password',
                              inputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                        RoundedButton(
                          buttonText: 'Sign Up',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Go back to login
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(color: Colors.white, width: 1),
                              ),
                            ),
                            child: Text(
                              'Already have an account? Login',
                              style: kBodyText.copyWith(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
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

// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   void _signUp() {
//     String name = nameController.text.trim();
//     String email = emailController.text.trim();
//     String password = passwordController.text.trim();
//     String confirmPassword = confirmPasswordController.text.trim();

//     if (name.isEmpty ||
//         email.isEmpty ||
//         password.isEmpty ||
//         confirmPassword.isEmpty) {
//       _showMessage('All fields are required!');
//     } else if (password != confirmPassword) {
//       _showMessage('Passwords do not match!');
//     } else {
//       _showMessage('Sign-Up Successful!\nName: $name\nEmail: $email');
//       // Later, send this data to your backend API for user registration
//     }
//   }

//   void _showMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade400, Colors.purple.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.person_add, size: 80, color: Colors.white),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'Create an Account',
//                   style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),
//                 _buildTextField(nameController, 'Full Name', Icons.person),
//                 const SizedBox(height: 10),
//                 _buildTextField(emailController, 'Email', Icons.email),
//                 const SizedBox(height: 10),
//                 _buildTextField(passwordController, 'Password', Icons.lock,
//                     isPassword: true),
//                 const SizedBox(height: 10),
//                 _buildTextField(
//                     confirmPasswordController, 'Confirm Password', Icons.lock,
//                     isPassword: true),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _signUp,
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 80, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30)),
//                     backgroundColor: Colors.white,
//                   ),
//                   child: Text('Sign Up',
//                       style:
//                           TextStyle(color: Colors.blue.shade700, fontSize: 18)),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Go back to login page
//                   },
//                   child: const Text('Already have an account? Sign In',
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       TextEditingController controller, String hintText, IconData icon,
//       {bool isPassword = false}) {
//     return TextField(
//       controller: controller,
//       obscureText: isPassword,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.white70),
//         prefixIcon: Icon(icon, color: Colors.white),
//         filled: true,
//         fillColor: Colors.white.withOpacity(0.2),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none),
//         contentPadding:
//             const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       ),
//     );
//   }
// }
