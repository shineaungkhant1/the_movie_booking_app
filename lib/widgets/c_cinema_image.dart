import 'package:flutter/material.dart';

class CCinemaImage extends StatelessWidget {
  const CCinemaImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
        image:AssetImage('assets/images/CCinemaLogo.png'),
        width: 200);
  }
}