import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();

  int currentPage = 0;
  Timer? sliderTimer;

  final List<String> heroImages = [
    "https://picsum.photos/id/237/1600/900",
    "https://picsum.photos/id/1011/1600/900",
    "https://picsum.photos/id/1005/1600/900",
  ];

  final List<String> heroTexts = [
    "Professional ABA Therapy Services for Every Child",
    "Supportive and Play-Based Therapy Approach",
    "Empowering Families Through Compassionate Care",
  ];

  @override
  void initState() {
    super.initState();

    sliderTimer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        if (_pageController.hasClients) {
          currentPage++;

          if (currentPage >= heroImages.length) {
            currentPage = 0;
          }

          _pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    sliderTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool mobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      drawer: mobile ? const MobileDrawer() : null,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "ABA Therapy",
          style: TextStyle(
            color: Color(0xFF2B59FF),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: mobile
            ? null
            : [
                _navItem("Home"),
                _navItem("Career"),
                PopupMenuButton<String>(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: Text(
                        "Location",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: "Valenzuela",
                      child: Text("Valenzuela"),
                    ),
                    PopupMenuItem(
                      value: "Roosevelt",
                      child: Text("Roosevelt"),
                    ),
                    PopupMenuItem(
                      value: "Tandang Sora",
                      child: Text("Tandang Sora"),
                    ),
                    PopupMenuItem(
                      value: "Bulacan",
                      child: Text("Bulacan"),
                    ),
                  ],
                ),
                _navItem("About Us"),
                _navItem("Contact Us"),
                const SizedBox(width: 20),
              ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HERO SLIDER
            SizedBox(
              height: mobile ? 500 : 700,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: heroImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [

                          Image.network(
                            heroImages[index],
                            fit: BoxFit.cover,
                          ),

                          Container(
                            color: Colors.black.withOpacity(.45),
                          ),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ABA Learning Difference Therapy Center",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 30 : 55,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  Text(
                                    heroTexts[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: mobile ? 16 : 22,
                                    ),
                                  ),

                                  const SizedBox(height: 40),

                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(0xFF2B59FF),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 35,
                                        vertical: 16,
                                      ),
                                    ),
                                    child: const Text("Learn More"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            // ABA SECTION
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1200),
              tween: Tween<double>(
                begin: 60,
                end: 0,
              ),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value),
                  child: Opacity(
                    opacity: 1 - (value / 60),
                    child: child,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 80,
                ),
                child: mobile
                    ? Column(
                        children: [
                          _abaTextSection(),
                          const SizedBox(height: 40),
                          const RotatingGallery(),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _abaTextSection(),
                          ),
                          const Expanded(
                            child: RotatingGallery(),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _abaTextSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What is ABA Therapy?",
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          "Applied Behavior Analysis (ABA) is a therapy based on the science of learning and behavior. It helps children improve communication, social interaction, focus, and daily living skills.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: Colors.black54,
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          "ABA uses positive reinforcement and structured learning to help children grow with confidence in a fun and supportive environment.",
          style: TextStyle(
            fontSize: 18,
            height: 1.8,
            color: Colors.black54,
          ),
        ),

        const SizedBox(height: 25),

        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2B59FF),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 16,
            ),
          ),
          child: const Text("Learn More"),
        ),
      ],
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          DrawerHeader(
            child: Text(
              "ABA Therapy",
              style: TextStyle(fontSize: 24),
            ),
          ),
          ListTile(title: Text("Home")),
          ListTile(title: Text("Career")),
          ExpansionTile(
            title: Text("Location"),
            children: [
              ListTile(title: Text("Valenzuela")),
              ListTile(title: Text("Roosevelt")),
              ListTile(title: Text("Tandang Sora")),
              ListTile(title: Text("Bulacan")),
            ],
          ),
          ListTile(title: Text("About Us")),
          ListTile(title: Text("Contact Us")),
        ],
      ),
    );
  }
}

class RotatingGallery extends StatefulWidget {
  const RotatingGallery({super.key});

  @override
  State<RotatingGallery> createState() => _RotatingGalleryState();
}

class _RotatingGalleryState extends State<RotatingGallery>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  final List<String> images = [
    "https://picsum.photos/id/1015/500/500",
    "https://picsum.photos/id/1025/500/500",
    "https://picsum.photos/id/1035/500/500",
    "https://picsum.photos/id/1045/500/500",
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 350,
      child: AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Transform.rotate(
            angle: controller.value * 2 * pi,
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(
                images.length,
                (index) {
                  final angle =
                      (2 * pi / images.length) * index;

                  return Transform.translate(
                    offset: Offset(
                      cos(angle) * 120,
                      sin(angle) * 120,
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          NetworkImage(images[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}