import 'package:flutter/material.dart';

import '../widgets/mobile_drawer.dart';
import '../widgets/hero_slider.dart';
import '../widgets/aba_section.dart';
import '../widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  bool isScrolled = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final scrolled = _controller.offset > 20;

      if (scrolled != isScrolled) {
        setState(() {
          isScrolled = scrolled;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                // 🔥 HERO SECTION MO (carousel/slider)
                HeroSlider(),

                // OTHER CONTENT
                Container(
                  height: 1000,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Header(
              isScrolled: isScrolled,
            ),
          ),
        ],
      ),
    );
  }
}