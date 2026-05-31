import 'dart:async';

import 'package:flutter/material.dart';

import '../models/slider_data.dart';

class HeroSlider extends StatefulWidget {
  const HeroSlider({super.key});

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  final PageController controller = PageController();

  int currentPage = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 4),
      (_) {
        currentPage++;

        if (currentPage >= SliderData.images.length) {
          currentPage = 0;
        }

        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = MediaQuery.of(context).size.width < 768;

    return SizedBox(
      height: mobile ? 500 : 700,
      child: PageView.builder(
        controller: controller,
        itemCount: SliderData.images.length,
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                SliderData.images[index],
                fit: BoxFit.cover,
              ),

              Container(
                color: Colors.black.withOpacity(.45),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      SliderData.texts[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Learn More"),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}