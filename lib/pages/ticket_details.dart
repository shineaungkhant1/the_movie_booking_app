import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';
import 'check_out.dart';

class TicketDetailsPage extends StatefulWidget {
  const TicketDetailsPage({Key? key}) : super(key: key);

  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {

  bool isShow2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        backgroundColor: STARTING_APP_BG_COLOR,
        leading: const Icon(Icons.arrow_back_ios_rounded),
        title:Text(
          "Ticket Details",style: GoogleFonts.dmSans(
          fontSize: 22,
          fontWeight: FontWeight.w700
        ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 370,
                  height: 660,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(68, 68, 68, 1),
                        Color.fromRGBO(34, 34, 34, 1),
                        Color.fromRGBO(68, 68, 68, 1)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieNameAndType(),
                        CinemaName(),
                        DateTimeLocation(),
                        SizedBox(height: 10),
                        Tickets(),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        SizedBox(height: 10),
                        FoodAndBeverage(),
                        SizedBox(height: 20),
                        Divider(
                        color: Colors.grey,
                      ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Convenience Fee",
                                      style: GoogleFonts.dmSans(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isShow2 = !isShow2;
                                        });
                                      },
                                      icon: isShow2
                                          ? Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                      )
                                          : Icon(
                                        Icons.keyboard_arrow_up,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "500Ks",
                                  style: GoogleFonts.dmSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Visibility(
                              visible: isShow2,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DialogView();
                                      });
                                },
                                child: Container(
                                  width: 191,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color.fromRGBO(255, 46, 0, 1.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Text(
                                          "Ticket Cancelion Policy",
                                          style: GoogleFonts.dmSans(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(height: 30),
                        TotalPrice(),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        Text(
                          "Refund Amount",style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white
                        ),
                        ),
                        Text(
                          "15000KS",style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color.fromRGBO(255, 46, 0, 1.0),
                        ),
                        ),
                      ],
                    ),
                    Image(
                      image:AssetImage("assets/images/cancelBooking.png"),width: 200,
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 430,
            left: 10,
            child: Container(
              width: 35,
              height: 30,
              decoration: BoxDecoration(
                color: STARTING_APP_BG_COLOR,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
            ),
          ),
          Positioned(
            top: 430,
            right: 10,
            child: Container(
              width: 35,
              height: 30,
              decoration: BoxDecoration(
                color: STARTING_APP_BG_COLOR,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
            ),
          )
        ]
      ),
    );
  }
}
