import 'package:flutter/material.dart';
import 'package:solar_system_app/Screens/Welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema Solar',
      theme: ThemeData(),
      home: const WelcomeScreen()
    );
  }
}