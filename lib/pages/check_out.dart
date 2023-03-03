import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/pages/food_page.dart';
import 'package:the_movie_booking_app/pages/payment_page.dart';

import '../resources/colors.dart';

class CheckOut extends StatefulWidget {
  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                CheckOutBar(),
                SizedBox(height: 30),
                Container(
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
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                        ConvenienceFeeAndPolicy(),
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
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                  child: Image(
                    image: AssetImage("assets/images/continuebtn.png"),
                    height: 49,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 509,
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
            top: 509,
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
        ],
      ),
    );
  }
}

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: GoogleFonts.inter(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "22500Ks",
          style: GoogleFonts.inter(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class ConvenienceFeeAndPolicy extends StatefulWidget {
  const ConvenienceFeeAndPolicy({Key? key}) : super(key: key);

  @override
  State<ConvenienceFeeAndPolicy> createState() =>
      _ConvenienceFeeAndPolicyState();
}

class DialogView extends StatelessWidget {
  const DialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.all(2),
      content: Container(
        width: 320,
        height: 462,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: STARTING_APP_BG_COLOR,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:15,top: 15,right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ticket Cancelation Policy",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image(
                    image: AssetImage("assets/images/cup.png"),
                    color: Colors.white,
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "100% Refund on F&B",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image(
                    image: AssetImage("assets/images/ticket.png"),
                    color: Colors.white,
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Up to 75% Refund fot Tickets",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "-75% refund until 2 hours before show start time",
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "-50% refund between 2 hours and 20 minutes before show start time",
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:30),
              Text(
                "1. Refund not avaliable for Convenience fees,Vouchers,Gift Cards,Taxes etc.",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "2. No cancelation within 20minute of show start time.",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child:Center(
                    child: Text(
                      "Close",
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConvenienceFeeAndPolicyState extends State<ConvenienceFeeAndPolicy> {
  bool isShow2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  color: Color.fromRGBO(255, 107, 0, 1.0)),
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
    );
  }
}

class FoodAndBeverage extends StatefulWidget {
  @override
  State<FoodAndBeverage> createState() => _FoodAndBeverageState();
}

class _FoodAndBeverageState extends State<FoodAndBeverage> {
  bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/cup.png"),
                  color: Colors.white,
                  height: 18,
                ),
                SizedBox(width: 5),
                Text(
                  "Food and Beverage",
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: isShow
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
              "2000Ks",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Visibility(
          visible: isShow,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/x.png"),
                        color: Colors.green,
                        height: 13,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Potatoe Chips (Qt.1)",
                        style: GoogleFonts.dmSans(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "1000Ks",
                    style: GoogleFonts.dmSans(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/x.png"),
                        color: Colors.green,
                        height: 13,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Cocala Large (Qt.1)",
                        style: GoogleFonts.dmSans(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "1000Ks",
                    style: GoogleFonts.dmSans(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Tickets extends StatelessWidget {
  const Tickets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
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
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Gold-G8,G7",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "20000Ks",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class DateTimeLocation extends StatelessWidget {
  const DateTimeLocation({
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

class CinemaName extends StatelessWidget {
  const CinemaName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          Text(
            "JCGV:Junction City",
            style: TextStyle(
                color: Colors.green, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            "(SCREEN 2)",
            style: TextStyle(
              color: Colors.white24,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class MovieNameAndType extends StatelessWidget {
  const MovieNameAndType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Black Widow (3D) (U/A)",
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

class CheckOutBar extends StatelessWidget {
  const CheckOutBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => FoodPage(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 120),
        Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
