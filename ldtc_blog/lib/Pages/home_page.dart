import 'package:flutter/material.dart';

import '../widgets/mobile_drawer.dart';
import '../widgets/hero_slider.dart';
import '../widgets/aba_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      drawer: mobile ? const MobileDrawer() : null,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "ABA Therapy",
          style: TextStyle(
            color: Color(0xFF2B59FF),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeroSlider(),
            AbaSection(),
          ],
        ),
      ),
    );
  }
}