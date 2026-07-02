import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/mobile_drawer.dart';
import '../widgets/hero_slider.dart';
import '../widgets/aba_section.dart';
import '../widgets/header.dart';
import '../widgets/services_section.dart';
import '../widgets/stats_section.dart';
import '../widgets/stats_background.dart';
import '../widgets/video_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/testimonials_section.dart';


class HomePage extends StatefulWidget {
  final bool scrollToServices;

  const HomePage({
    super.key,
    this.scrollToServices = false,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
      final servicesKey = GlobalKey();
      final abaKey = GlobalKey();
      
  void scrollToSection(GlobalKey key) {
      final context = key.currentContext;

  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }
}

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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
  if (widget.scrollToServices) {
    await Future.delayed(const Duration(milliseconds: 300));

    if (mounted) {
      scrollToSection(servicesKey);
    }
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        key: _scaffoldKey,
        drawer: mobile
    ? MobileDrawer(
        onServicesTap: () => scrollToSection(servicesKey),
        onAboutTap: () => scrollToSection(abaKey),
      )
    : null,
        body: Container(
          color: const Color.fromARGB(255, 216, 255, 192),
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: [
                    const HeroSlider(),


                    SizedBox(height: mobile ? 30 : 20),

                    KeyedSubtree(
                      key: servicesKey,
                      child: const ServicesSection(),
                    ),

                    SizedBox(height: mobile ? 30 : 20),

                    const AbaSection(),

                    SizedBox(height: mobile ? 30 : 20),
  
                 StatsBackground(
                        child: const StatsSection(),
                      ),

                  SizedBox(height: mobile ? 30 : 80),

                  const VideoSection(),

                  SizedBox(height: mobile ? 30 : 80),

                  const FAQSection(),
                
                  SizedBox(height: mobile ? 30 : 80),

                  const TestimonialsSection(),

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
                    onServicesTap: () => scrollToSection(servicesKey),
                    onAboutTap: () => scrollToSection(abaKey),
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


