import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/palatte.dart';
import 'package:frontend/widgets/roundedbutton.dart';
import 'package:frontend/widgets/textinput.dart';
import 'widgets/background.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

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
                      'Reset Password',
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
                          children: const [
                            TextInput(
                              icon: FontAwesomeIcons.solidEnvelope,
                              hint: 'Enter your email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                        RoundedButton(
                          buttonText: 'Send Reset Link',
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
                              'Back to Login',
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
