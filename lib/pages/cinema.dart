import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/pages/booking_page.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

import 'cinema_search_page.dart';

class Cinema extends StatefulWidget {
  const Cinema({Key? key}) : super(key: key);

  @override
  State<Cinema> createState() => _CinemaState();
}

class _CinemaState extends State<Cinema> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: STARTING_APP_BG_COLOR,
          leading: Icon(
            Icons.movie
          ),
          title:Text(
            "Cinema List",style: GoogleFonts.dmSans(
            fontSize:16,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),
          ),
          actions: [
            GestureDetector(
              onTap: (){
                _navigateToCinemaSearchPage(context);
              },
              child: Container(
                // width: 30,
                //  height: 30,
                child:Icon(
                  Icons.search
                ),
              ),
            ),
            SizedBox(width: 25),
            Container(
              // width: 30,
              // height: 30,
              child: Icon(
                  Icons.notifications
              ),
            ),
            SizedBox(width: 25),
            Container(
              // width: 30,
              //  height: 30,
              child: Icon(
                  Icons.qr_code_scanner
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        body: CinemasAndShowTimes()
    );
  }
}
Future<dynamic> _navigateToCinemaSearchPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CinemaSearchPage(),
    ),
  );
}