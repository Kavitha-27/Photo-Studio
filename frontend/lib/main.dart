import 'package:flutter/material.dart';
import 'package:frontend/dashboard.dart';
import 'package:frontend/edit_shop.dart';
import 'package:frontend/login.dart';
import 'package:frontend/profile_page.dart';
import 'package:frontend/reset.dart';
import 'package:frontend/sign_up.dart';
import 'package:frontend/user_page.dart';
import 'package:frontend/view_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        // home: DashboardPage());
        home: UploadImagePage());
    // home: LoginPage());
    // home: const SignUpPage());
    // home: const ResetPasswordPage());
  }
}
