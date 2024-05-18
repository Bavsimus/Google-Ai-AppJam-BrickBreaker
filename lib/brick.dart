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
        decoration: BoxDecoration(
          color: Colors.orange, // Kitap rengi
          borderRadius: BorderRadius.circular(10), // Kenar yuvarlaklığı
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Gölge rengi
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Container(
                width: width - 20,
                height: height - 20,
                decoration: BoxDecoration(
                  color: Colors.grey, // Sayfa rengi
                  borderRadius: BorderRadius.circular(5), // Sayfa kenar yuvarlaklığı
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}