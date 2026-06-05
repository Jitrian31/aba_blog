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
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 450,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: List.generate(
              images.length,
              (index) {
                final angle =
                    (2 * pi / images.length) * index +
                    (controller.value * 2 * pi);

                final z = cos(angle);

                final scale = 0.6 + ((z + 1) / 2) * 0.6;

                final x = sin(angle) * 180;

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..translate(x, 0.0, z * 100),
                  child: Transform.scale(
                    scale: scale,
                    child: Opacity(
                      opacity: 0.4 + ((z + 1) / 2) * 0.6,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage:
                            AssetImage(images[index]),
                      ),
                    ),
                  ),
                );
              },
            )..sort((a, b) => 0),
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