import 'package:fic7_fe/common/constants/light_theme.dart';

import 'package:fic7_fe/pages/dashboard/dashboard_page.dart';

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
      home: const DashboardPage(),
    );
  }
}
