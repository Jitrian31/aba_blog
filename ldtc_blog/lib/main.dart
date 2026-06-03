import 'package:flutter/material.dart';
import 'package:ldtc_blog/Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABA LDTC Group of Companies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2B59FF),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}