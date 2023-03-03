import 'package:flutter/material.dart';
class MyClipper extends CustomClipper<Path> {
  final double holeRadius;

  MyClipper({required this.holeRadius});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(
          0.0, size.height - (size.height / 2 - holeRadius / 2) - holeRadius)
      ..arcToPoint(
        Offset(0, size.height - (size.height / 2 - holeRadius / 2)),
        clockwise: true,
        radius: Radius.circular(1),
      )
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height - (size.height / 2 - holeRadius / 2))
      ..arcToPoint(
        Offset(size.width,
            size.height - (size.height / 2 - holeRadius / 2) - holeRadius),
        clockwise: true,
        radius: Radius.circular(1),
      );

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class GiftBanner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(size.width, 0);

    path.lineTo(0.0, size.height);

    path.lineTo(size.width, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) {
    return old != this;
  }
}