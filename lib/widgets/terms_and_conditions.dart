import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "By clicking, I accept the Terms & Conditions & Privacy Plolicy",
      style: TextStyle(
        color: Color.fromRGBO(59, 59, 60, 1.0),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}