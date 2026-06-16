import 'package:flutter/material.dart';

import '../widgets/mobile_drawer.dart';
import '../widgets/hero_slider.dart';
import '../widgets/aba_section.dart';
import '../widgets/header.dart';
import '../widgets/services_section.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  final ScrollController _controller = ScrollController();
  bool isScrolled = false;
  bool? _lastMobile;
  

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
  return LayoutBuilder(
    builder: (context, constraints) {
      final mobile = constraints.maxWidth < 768;

if (_lastMobile != null && _lastMobile != mobile) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context, rootNavigator: true).maybePop();
  });
}

_lastMobile = mobile;



      return Scaffold(
        backgroundColor: const Color(0xFFF5F7FB),
        key: _scaffoldKey,
        drawer: mobile ? const MobileDrawer() : null,
        body: Container(
          color: const Color(0xFFF5F7FB),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    HeroSlider(),
                    const ServicesSection(),
                    const SizedBox(height: 80),
                    const AbaSection(),
                    const SizedBox(height: 80),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Header(
                  key: ValueKey(mobile),
                  isScrolled: isScrolled,
                  mobile: mobile,
                  scaffoldKey: _scaffoldKey,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

}
}


