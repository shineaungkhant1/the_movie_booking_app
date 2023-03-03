import 'package:flutter/material.dart';

class CustomChipShape extends ShapeBorder {
  final double borderRadius;

  CustomChipShape(this.borderRadius);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(borderRadius)));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return CustomChipShape(borderRadius * t);
  }
}

class CustomChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final double borderRadius;

  const CustomChip(
     this.label,
     this.backgroundColor,
    this.borderRadius
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: ShapeDecoration(
        shape: CustomChipShape(borderRadius),
        color: backgroundColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
