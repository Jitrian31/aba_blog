import 'dart:math';

import 'package:flutter/material.dart';

class RotatingGallery extends StatefulWidget {
  const RotatingGallery({super.key});

  @override
  State<RotatingGallery> createState() => _RotatingGalleryState();
}

class _RotatingGalleryState extends State<RotatingGallery>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

final images = [
  "assets/images/ABA1.jpg",
  "assets/images/ABA2.jpg",
  "assets/images/ABA3.jpg",
  "assets/images/ABA4.jpg",
  "assets/images/ABA5.jpg",
  "assets/images/ABA6.jpg",
  "assets/images/ABA7.jpg",
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 450,
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
                      cos(angle) * 150,
                      sin(angle) * 150,
                    ),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage(images[index]),
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}