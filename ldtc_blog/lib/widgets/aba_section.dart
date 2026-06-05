import 'package:flutter/material.dart';

import 'rotating_gallery.dart';

class AbaSection extends StatelessWidget {
  const AbaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 80,
      ),
      child: mobile
          ? Column(
              children: [
                _content(),
                const SizedBox(height: 40),
                const RotatingGallery(),
              ],
            )
          : Row(
              children: [
                Expanded(child: _content()),
                const Expanded(
                  child: RotatingGallery(),
                ),
              ],
            ),
    );
  }

  Widget _content() {
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

        const SizedBox(height: 20),

        const Text(
           '''Applied Behavior Analysis (ABA) is a scientific approach to understanding and improving behavior. It focuses on how learning takes place and how behavior is influenced by the environment.

ABA therapy is commonly used to help children and individuals develop important skills, such as:

• Communication and language skills
• Social interaction skills
• Play and leisure skills
• Self-care and daily living skills
• Academic and learning skills
• Attention and focus
• Reducing challenging behaviors that may interfere with learning or daily life''',
  style: TextStyle(
    fontSize: 20,
    height: 1.6,
    color: Colors.black87,
  )
),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {},
          child: const Text("Learn More"),
        ),
      ],
    );
  }
}