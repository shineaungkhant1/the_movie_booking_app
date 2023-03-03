import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/otp_page.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import '../resources/string.dart';
import '../widgets/phone_numbr_and_google.dart';
import '../widgets/c_cinema_image.dart';
import '../widgets/terms_and_conditions.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      body: SingleChildScrollView (
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30),
                CCinemaImage(),
                SizedBox(height: 30),
                LoginScreenText1(),
                SizedBox(height: 10),
                LoginScreenText2(),
                SizedBox(height: 50),
                Container(
                  padding: const EdgeInsets.only(left: 31,right: 26),
                  child: PhoneNumbrAndGoogle((){
                    Navigator.push(context, MaterialPageRoute(
                        builder:(context) => OtpPage() ));
                  }),
                ),
                SizedBox(height: 120),
                TermsAndConditions(),
              ],
            ),
          ),
        ),
      ),
    ) ;
  }
}



class LoginScreenText1 extends StatelessWidget {
  const LoginScreenText1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      LOGIN_SCREEN_TEXT_1,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}

class LoginScreenText2 extends StatelessWidget {
  const LoginScreenText2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Text(
        LOGIN_SCREEN_TEXT_2,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: LOGIN_SCREEN_TEXT_AND_OTP_COLOR2,
        ),
      ),
    );
  }
}


