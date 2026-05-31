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
          "Applied Behavior Analysis (ABA) is a therapy based on the science of learning and behavior.",
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