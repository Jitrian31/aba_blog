import 'package:flutter/material.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int current = 1;

  final List<Map<String, String>> testimonials = [
    {
      "image": "assets/images/client1.jpg",
      "name": "Mark's Mom",
      "service": "ABA Therapy",
      "review":
          "Our son has shown remarkable improvement in communication, social interaction, and daily living skills. The therapists are caring, patient, and always encourage his growth.",
    },
    {
      "image": "assets/images/client2.jpg",
      "name": "Lucy's Mom",
      "service": "Speech Therapy",
      "review":
          "The therapists made every session enjoyable and engaging. My daughter has become much more confident speaking and interacting with others.",
    },
    {
      "image": "assets/images/client3.jpg",
      "name": "Jane's Mom",
      "service": "Occupational Therapy",
      "review":
          "We truly appreciate the dedication of the therapists. The clinic provides a warm, welcoming environment where every child is treated with compassion.",
    },
  ];

  void next() {
    setState(() {
      current = (current + 1) % testimonials.length;
    });
  }

  void previous() {
    setState(() {
      current =
          (current - 1 + testimonials.length) % testimonials.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 900;

    if (mobile) {
      return _mobileLayout();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          const Text(
            "- Testimonials -",
            style: TextStyle(
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 18),

          const Text(
            "Read Stories of Our Clients",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Color(0xff0E5B57),
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "Parents and their kids always leave our clinic fully satisfied.",
            style: TextStyle(
              fontSize: 22,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 60),

          Row(
            children: [

              IconButton(
                onPressed: previous,
                icon: const Icon(Icons.arrow_back_ios,size: 35),
              ),

              Expanded(
                child: Row(
                  children: List.generate(
                    testimonials.length,
                    (index) {

                      final highlight = index == current;

                      return Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          padding: const EdgeInsets.all(30),
                          height: highlight ? 540 : 500,
                          decoration: BoxDecoration(
                            color: highlight
                                ? const Color(0xffFFF4DF)
                                : const Color(0xffEEF4F3),
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 18,
                                offset: const Offset(0,8),
                                color: Colors.black12,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Icon(
                                Icons.format_quote,
                                size: 55,
                                color: highlight
                                    ? Colors.deepOrange
                                    : Colors.teal,
                              ),

                              const SizedBox(height: 25),

                              Expanded(
                                child: Text(
                                  testimonials[index]["review"]!,
                                  style: TextStyle(
                                    fontSize: 24,
                                    height: 1.7,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),

                              Row(
                                children: [

                                  CircleAvatar(
                                    radius: 38,
                                    backgroundImage: AssetImage(
                                      testimonials[index]["image"]!,
                                    ),
                                  ),

                                  const SizedBox(width: 15),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        testimonials[index]["name"]!,
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: highlight
                                              ? Colors.deepOrange
                                              : const Color(0xff0E5B57),
                                        ),
                                      ),

                                      const SizedBox(height: 5),

                                      Text(
                                        testimonials[index]["service"]!,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              IconButton(
                onPressed: next,
                icon: const Icon(Icons.arrow_forward_ios,size:35),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Column(
      children: [
        const Text(
          "Testimonials",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "Read Stories of Our Clients",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        Row(
          children: [

            /// LEFT BUTTON
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: previous,
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: SizedBox(
                height: 500,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: Container(
                    key: ValueKey(current),
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color(0xffEEF4F3),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 15,
                          color: Colors.black12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Icon(
                          Icons.format_quote,
                          size: 45,
                          color: Colors.teal,
                        ),

                        const SizedBox(height: 20),

                        Expanded(
                          child: Text(
                            testimonials[current]["review"]!,
                            style: const TextStyle(
                              fontSize: 18,
                              height: 1.6,
                            ),
                          ),
                        ),

                        Row(
                          children: [

                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                testimonials[current]["image"]!,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  testimonials[current]["name"]!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),

                                Text(
                                  testimonials[current]["service"]!,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            /// RIGHT BUTTON
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: next,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}