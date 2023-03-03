import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation.dart';
import 'package:the_movie_booking_app/pages/ticket_details.dart';

import 'check_out.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => TicketDetailsPage(),
              )
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 30,
            right: 30,
          ),
          child: ListView.separated(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
            return Container(
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
                            Text(
                              "JCGV : Junction City",
                              style: GoogleFonts.dmSans(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
            );
          }, separatorBuilder: (BuildContext context, int index) {
              return Divider(
              );
          },
          ),
        ),
      ),
    );
  }
}
