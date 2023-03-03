import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation.dart';

class BookingSuccessScreen extends StatefulWidget {
  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  State<BookingSuccessScreen> createState() => _BookingSuccessScreenState();
}

class _BookingSuccessScreenState extends State<BookingSuccessScreen> {

 /* void initState(){
    super.initState();
    _navigateToTicketConformationPage();
  }*/

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.9),
          child: Image(
              image: AssetImage("assets/images/peopleandballoom.png"),width: 388,height: 364,
          ),
        ),
    );



  }
/*  Future<void> _navigateToTicketConformationPage() async {
    await Future.delayed(Duration(seconds: 6),);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketConformationPage()));
  }*/
}
