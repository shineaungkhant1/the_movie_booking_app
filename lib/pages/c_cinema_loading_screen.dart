import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';

import '../resources/colors.dart';

class CCinemaLoadingScreen extends StatefulWidget {
  const CCinemaLoadingScreen({Key? key}) : super(key: key);

  @override
  State<CCinemaLoadingScreen> createState() => _CCinemaLoadingScreenState();

}


class _CCinemaLoadingScreenState extends State<CCinemaLoadingScreen> {

  void initState(){
    super.initState();
    _navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      body: Container(
        padding:EdgeInsets.symmetric(vertical:300),
        alignment: Alignment.center,
        child: Column(
          children: [
            CCinemaLogo(),
            SizedBox(height: 10),
            CCinemaText(),
          ],
        ),
      ),
    );
  }
  Future<void> _navigateToHomePage() async {
    await Future.delayed(Duration(seconds: 6),);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}

class CCinemaText extends StatelessWidget {
  const CCinemaText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "C Cinema",
        style: TextStyle(
          fontFamily: 'Inter',
          fontStyle:FontStyle.normal,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: CINEMA_TEXT_COLOR,
          letterSpacing: -0.3312,
        ),
      ),
    );
  }
}

class CCinemaLogo extends StatelessWidget {
  const CCinemaLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/images/CCinemaLogo.png'),width: 150,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
