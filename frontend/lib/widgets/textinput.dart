import 'package:flutter/material.dart';
import 'package:frontend/palatte.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    // required Key key,
    super.key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
  });

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            hintStyle: kBodyText.copyWith(fontSize: 16),
          ),
          style: kBodyText.copyWith(fontSize: 16),
          keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
