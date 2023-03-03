import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/pages/bottom_nav_bar.dart';
import 'package:the_movie_booking_app/widgets/booking_success_screen.dart';
import 'package:the_movie_booking_app/pages/check_out.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

class TicketConformationPage extends StatefulWidget {
  const TicketConformationPage({Key? key}) : super(key: key);

  @override
  State<TicketConformationPage> createState() => _TicketConformationPageState();
}

class _TicketConformationPageState extends State<TicketConformationPage> {

  bool isPoped=true;

  @override
  void initState() {
    super.initState();
    _showOverlay();
  }

  _showOverlay()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      isPoped=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Column(
              children: [
                SizedBox(height: 50),
                TicketConfirmationTitle(),
                SizedBox(height: 40),
                Container(
                  width: 370,
                  height: 305,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(98, 98, 98, 1),
                        Color.fromRGBO(38, 38, 38, 0),
                        Color.fromRGBO(39, 39, 39, 0.45),
                        Color.fromRGBO(51, 51, 51, 1)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0,right: 0,top: 12,bottom: 12),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            MovieImage(),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MovieTitle(),
                                SizedBox(height:10 ),
                                CinemaName(),
                                SizedBox(height: 25),
                                TicketQuantity(),
                                SizedBox(height:10 ),
                                SeatsAndScreen(),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 22),
                       DottedAndCircle(),
                        SizedBox(height: 10),
                        DateTimeAndLocation(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
                QRSection(),
                SizedBox(height:80),
                ConfirmButton(),
              ],
            ),
          ),
          isPoped?BookingSuccessScreen():Container(),
        ],
      ),
    );
  }
}

class DottedAndCircle extends StatelessWidget {
  const DottedAndCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 100,right: 10),
          width: 20,
          height: 30,
          decoration:BoxDecoration(
            color:STARTING_APP_BG_COLOR,
            borderRadius: BorderRadius.only(topRight:Radius.circular(15),bottomRight: Radius.circular(15)),
          ),
        ),
        Text("-------------------------------------------------------------------------",style: TextStyle(
          color: Colors.grey
        ),),
        Container(
          width: 20,
          height: 30,
          decoration:BoxDecoration(
            color: STARTING_APP_BG_COLOR,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)),
          ),
        ),
      ],
    );
  }
}

class QRSection extends StatelessWidget {
  const QRSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
            image:AssetImage("assets/images/qrcode.png"),height: 93,width: 93,
        ),
        SizedBox(height:20 ),
        Text(
          "WAG5LP1C",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 16.7,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TPIN :",
              style: GoogleFonts.dmSans(
                color: Colors.grey,
                fontSize: 16.7,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "WKCSL96",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 16.7,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BottomNavBar(),
            )
        );
      },
      child: Container(
        width: 176,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.green
        ),
        child: Center(
          child: Text(
            "DONE",style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          ),
        ),
      ),
    );
  }
}

class DateTimeAndLocation extends StatelessWidget {
  const DateTimeAndLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            Text(
              "Sat, 18 Jun, 2022",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(width: 40),
        Column(
          children: [
            Icon(
              Icons.access_time,
              color: Colors.green,
            ),
            SizedBox(height: 10),
            Text(
              "3:30PM",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(width: 50),
        Container(
          width: 90,
          child: Column(
            children: [
              SizedBox(height: 25),
              Icon(
                Icons.location_on_outlined,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              Text(
                "Q5H3+JPP, Corner of, Bogyoke Lann, Yangon",
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SeatsAndScreen extends StatelessWidget {
  const SeatsAndScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Gold-G8,G7",
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "(SCREEN 2)",
          style: TextStyle(
            color: Colors.white24,
            fontWeight: FontWeight.w400,
            fontSize: 9,
          ),
        )
      ],
    );
  }
}

class TicketQuantity extends StatelessWidget {
  const TicketQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "M-Ticket",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: "(",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: "2",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          TextSpan(
            text: ")",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class CinemaName extends StatelessWidget {
  const CinemaName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "JCGV : Junction City",
      style: GoogleFonts.dmSans(
        color: Colors.green,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Black Widow (3D) (U/A)",
      style: GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image:AssetImage("now_showing_movie_images/blackwidow.png"),
      height: 120,width: 96,
    );
  }
}

class TicketConfirmationTitle extends StatelessWidget {
  const TicketConfirmationTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Ticket Confirmation",
        style: GoogleFonts.dmSans(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
