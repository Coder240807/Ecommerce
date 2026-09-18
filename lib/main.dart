import 'package:flutter/material.dart';

// 1. Import your home screen file here
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the red debug corner banner
      title: 'E-Commerce App',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
