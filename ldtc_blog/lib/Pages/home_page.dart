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
final GlobalKey<ScaffoldState> _scaffoldKey =
    GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

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
  final mobile = MediaQuery.of(context).size.width < 768;

WidgetsBinding.instance.addPostFrameCallback((_) {
  if (!mobile) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).maybePop();
    }
  }
});

  return Scaffold(
    backgroundColor: const Color(0xFFF5F7FB),
    key: _scaffoldKey,
    drawer: const MobileDrawer(),
    body: Container(
      color: const Color(0xFFF5F7FB),
      child: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                HeroSlider(),
                const AbaSection(),
              ],
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Header(
              isScrolled: isScrolled,
              scaffoldKey: _scaffoldKey,
            ),
          ),
        ],
      ),
    ),
  );
}

}