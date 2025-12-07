import 'package:flutter/material.dart';
import 'package:frontend/palatte.dart';
import 'widgets/background.dart';
import 'widgets/roundedbutton.dart';
import 'widgets/textinput.dart';

class EditShopPage extends StatelessWidget {
  const EditShopPage({super.key});

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
                      'Edit Shop Profile',
                      style: kHeading.copyWith(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const TextInput(
                          icon: Icons.store,
                          hint: 'Shop Name',
                          inputType: TextInputType.name,
                          inputAction: TextInputAction.next,
                        ),
                        const TextInput(
                          icon: Icons.phone,
                          hint: 'Contact Number',
                          inputType: TextInputType.phone,
                          inputAction: TextInputAction.done,
                        ),
                        const SizedBox(height: 80),
                        RoundedButton(
                          buttonText: 'Save',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Cancel',
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
