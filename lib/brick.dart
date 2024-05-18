import 'package:flutter/material.dart';

class Brick {
  double x;
  double y;
  double width;
  double height;
  bool isVisible;

  Brick({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.isVisible = true,
  });

  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: width - 20,
                height: height - 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}