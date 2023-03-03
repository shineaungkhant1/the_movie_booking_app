                                                                                                                                                import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/booking_page.dart';
import 'package:the_movie_booking_app/pages/cinema.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';
import 'package:the_movie_booking_app/widgets/booking_success_screen.dart';
import 'package:the_movie_booking_app/pages/check_out.dart';
import 'package:the_movie_booking_app/pages/food_page.dart';
import 'package:the_movie_booking_app/pages/movie_details.dart';
import 'package:the_movie_booking_app/pages/bottom_nav_bar.dart';
import 'package:the_movie_booking_app/pages/c_cinema_loading_screen.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/otp_page.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/foods.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: STARTING_APP_BG_COLOR
      ),

      home:CCinemaLoadingScreen()
    );
  }
}
