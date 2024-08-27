// import 'package:fic7_fe/pages/home_page.dart';
import 'package:fic7_fe/common/constants/light_theme.dart';
import 'package:fic7_fe/pages/auth/auth_page.dart';
// import 'package:fic7_fe/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIC7-FE',
      debugShowCheckedModeBanner: false,
      theme: light,
      home: const AuthPage(),
    );
  }
}
