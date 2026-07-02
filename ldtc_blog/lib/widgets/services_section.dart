import 'package:flutter/material.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int currentIndex = 0;
Widget _serviceCard(
  String title,
  String description,
) {
  return Container(
    margin: const EdgeInsets.all(30),
    padding: const EdgeInsets.all(35),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(25),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 25),

        Expanded(
          child: SingleChildScrollView(
            child: Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                height: 1.8,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  final List<Map<String, String>> services = [
    {
      "title": "ABA Therapy",
      "description":
          "Focuses entirely on building foundational safety, communication, and learning-readiness skills. Rather than focusing on complex academic goals, short-term ABA therapy aims to reduce daily stress and frustration for both the child and the family.",
    },
    {
      "title": "Occupational Therapy",
      "description":
          "Focuses on immediate physical regulation, sensory comfort, and baseline physical cooperation. Short-term OT aims to stabilize the child's sensory system and build foundational motor control.",
    },
    {
      "title": "Speech Therapy",
      "description":
          "Focuses on establishing the core building blocks of communication. An SLP develops pre-linguistic skills, imitation, and language comprehension.",
    },
    {
      "title": "SPED Tutorial",
      "description":
          "Focuses on modifying academic delivery to build learning behaviors, desk endurance, and executive functions.",
    },
  ];

  void next() {
    setState(() {
      currentIndex = (currentIndex + 1) % services.length;
    });
  }

  void prev() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + services.length) % services.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Center(
      child: Container(
        width: mobile ? double.infinity : 1300,
        height: mobile ? 900 : 600,
        margin: const EdgeInsets.symmetric(vertical: 60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
            ),
          ],
        ),

child: mobile
    ? Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                const Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "We provide customized development tracks and learning pathways tailored for every age group and milestone.",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            color: Colors.black54,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Our therapists are committed to helping children build communication, independence, confidence, and essential life skills.",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            color: Colors.black54,
                          ),
                        ),

                const SizedBox(height: 30),

                GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity! < 0) {
                          next();
                        } else if (details.primaryVelocity! > 0) {
                          prev();
                        }
                      },
                      child: SizedBox(
                        height: 420,
                        child: _serviceCard(
                          services[currentIndex]["title"]!,
                          services[currentIndex]["description"]!,
                        ),
                      ),
                    )
              ],
            ),
          ),

          Positioned(
            left: 15,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF7ED957),
              child: IconButton(
                onPressed: prev,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),

          Positioned(
            right: 15,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF7ED957),
              child: IconButton(
                onPressed: next,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      )
            : Row(
                children: [
                  // LEFT
                  Container(
                    width: 320,
                    padding: const EdgeInsets.all(40),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Our Services",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 30),

                        Text(
                          "We provide customized development tracks and learning pathways tailored for every age group and milestone.",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            color: Colors.black54,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "Our therapists are committed to helping children build communication, independence, confidence, and essential life skills.",
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const VerticalDivider(width: 1),

                                    // RIGHT
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  children: [

                              Expanded(
                                    child: SizedBox(
                                      height: 500,
                                      child: _serviceCard(
                                        services[currentIndex]["title"]!,
                                        services[currentIndex]["description"]!,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 20),

                                  Expanded(
                                    child: SizedBox(
                                      height: 500,
                                      child: _serviceCard(
                                        services[(currentIndex + 1) % services.length]["title"]!,
                                        services[(currentIndex + 1) % services.length]["description"]!,
                                      ),
                                    ),
                                  ),

                            ],
                          ),
                        ),

                        Positioned(
                          left: 10,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: const Color(0xFF7ED957),
                            child: IconButton(
                              onPressed: prev,
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                          Positioned(
                            right: 10,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: const Color(0xFF7ED957),
                              child: IconButton(
                                onPressed: next,
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}