import 'package:flutter/material.dart';

import '../widgets/mobile_drawer.dart';
import '../widgets/hero_slider.dart';
import '../widgets/aba_section.dart';
import '../widgets/header.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      drawer: mobile ? const MobileDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            HeroSlider(),
            AbaSection(),
          ],
        ),
      ),
    );
  }
}