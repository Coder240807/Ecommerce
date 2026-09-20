import 'package:flutter/material.dart';
import 'package:ecommerceapp/widgets/bottombar.dart'; // Import your shell coordinate file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrendWay',
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.deepPurple),
      home:
          const MainLayout(), // Set MainLayout as the primary root screen entry
      debugShowCheckedModeBanner: false,
    );
  }
}
