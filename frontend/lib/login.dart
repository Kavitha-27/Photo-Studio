// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:frontend/main.dart';
// import 'package:frontend/palatte.dart';
// import 'package:frontend/reset.dart';
// import 'package:frontend/sign_up.dart';
// import 'package:frontend/widgets/password.dart';
// import 'package:frontend/widgets/roundedbutton.dart';
// import 'package:frontend/widgets/textinput.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:frontend/widgets/background.dart';
// import 'package:frontend/widgets/roundedbutton.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Background(),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   Container(
//                     height: 150,
//                     child: Center(
//                       child: Text(
//                         'Foodybite',
//                         style: kHeading,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 40),
//                     child: const Column(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             TextInput(
//                               icon: FontAwesomeIcons.solidEnvelope,
//                               hint: 'Email',
//                               inputType: TextInputType.emailAddress,
//                               inputAction: TextInputAction.next,
//                             ),
//                             PasswordInput(
//                               icon: FontAwesomeIcons.lock,
//                               hint: 'Password',
//                               inputAction: TextInputAction.done,
//                             ),
//                             Text(
//                               'Forgot Password?',
//                               style: kBodyText.copyWith(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/main.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/profile_page.dart';
import 'package:frontend/reset.dart';
import 'package:frontend/sign_up.dart';
import 'package:frontend/widgets/password.dart';
import 'package:frontend/widgets/roundedbutton.dart';
import 'package:frontend/widgets/textinput.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/background.dart';

void main() {
  runApp(const MyApp());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  SizedBox(
                    height: 180,
                    child: Center(
                      child: Text(
                        'Kavi\'s Photography!',
                        style: kHeading.copyWith(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const TextInput(
                            icon: FontAwesomeIcons.solidEnvelope,
                            hint: 'Email',
                            inputType: TextInputType.emailAddress,
                            inputAction: TextInputAction.next,
                          ),
                          const PasswordInput(
                            icon: FontAwesomeIcons.lock,
                            hint: 'Password',
                            inputAction: TextInputAction.done,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordPage()),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: kBodyText.copyWith(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 20),
                          RoundedButton(
                              buttonText: 'Login',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProfilePage(),
                                    ));
                              })
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
