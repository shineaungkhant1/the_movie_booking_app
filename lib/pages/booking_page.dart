import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking_app/pages/cinema_info_detail_page.dart';
import 'package:the_movie_booking_app/pages/food_page.dart';
import 'package:the_movie_booking_app/pages/seating_plan_page.dart';

import '../resources/colors.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<String> weekDaysList = [
    "",
    "MON",
    "TUE",
    "WED",
    "THUR",
    "FRI",
    "SAT",
    "SUN",
  ];

  List<String> monthsList = [
    "",
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<DateTime> twoWeeks = [];

  var today = DateTime.now();
  void _showDate() {
    print("Show Date $today");
    print(today.weekday);
    for (int i = 0; i < 14; i++) {
      twoWeeks.add(today.add(Duration(days: i)));
    }
    print(twoWeeks);
  }

  @override
  void initState() {
    _showDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: STARTING_APP_BG_COLOR,
        leading: const Icon(Icons.arrow_back_ios_rounded),
        actions: [
          Row(
            children: [
              Image(
                image: AssetImage('assets/images/locationWhite.png'),
              ),
              SizedBox(width: 10),
              Text(
                "Yangon",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ],
          ),
          SizedBox(width: 15),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 25),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_sharp),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: twoWeeks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < 14; i++) {
                            isSelected[i] = false;
                          }
                          isSelected[index] = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(children: [
                              Container(
                                height: 100,
                                width: 71,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: isSelected[index]
                                      ? PRIMARY_GREEN
                                      : Color.fromRGBO(215, 215, 215, 1.0),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 5),
                                    Container(
                                      width: 22,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: STARTING_APP_BG_COLOR,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    (index == 0)
                                        ? Text("Today")
                                        : (index == 1)
                                            ? Text("Tomorrow")
                                            : Text(
                                                weekDaysList[
                                                    twoWeeks[index].weekday],
                                                style: GoogleFonts.inter(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                    SizedBox(height: 8),
                                    Text(
                                      monthsList[twoWeeks[index].month],
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      twoWeeks[index].day.toString(),
                                      style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 75,
                                right: 65,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: STARTING_APP_BG_COLOR,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 75,
                                left: 65,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: STARTING_APP_BG_COLOR,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: MovieType(),
            ),
            SizedBox(height: 20),
            TicketCheckOutBar(),
            SizedBox(height: 20),
            CinemasAndShowTimes(),
          ],
        ),
      ),
    );
  }
}

class CinemasAndShowTimes extends StatelessWidget {
  List<String> cinemaList = [
    "JCGV : Junction City",
    "JCGV : City Mall",
    "JCGV : Junction Square",
    "Mingalar Cinema Gold Class"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cinemaList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: ExpansionTile(

            title: Padding(
              padding: const EdgeInsets.only(left: 5, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cinemaList[index],
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Image(
                        image: AssetImage("assets/images/p.png"),
                        width: 14,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "Parking",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                        ),
                      ),
                      SizedBox(width: 8),
                      Image(
                        image: AssetImage("assets/images/cup.png"),
                        color: Color.fromRGBO(170, 170, 170, 1.0),
                        width: 14,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "Online Food",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                        ),
                      ),
                      SizedBox(width: 8),
                      Image(
                        image: AssetImage("assets/images/wheelchair.png"),
                        width: 14,
                      ),
                      SizedBox(width: 3),
                      Text(
                        "Wheel Chair",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(170, 170, 170, 1.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SeatingPlanPage()));
                },
                child: Container(
                  height: 250,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 5 / 5,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.black26,
                                  border: Border.all(color:Color.fromRGBO(255, 255, 255, 0.1),width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "9:30 AM",style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color:Colors.white
                                    ),
                                    ),
                                    Text(
                                      "3D",style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color:Colors.white
                                    ),
                                    ),
                                    Text(
                                      "Screen 1",style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color:Colors.white
                                    ),
                                    ),
                                    Text(
                                      "21 Available",style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color:Colors.white
                                    ),
                                    ),
                                  ],
                                )
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,color: Colors.grey,size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Long press on show timing to see seat class!",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CinemaInfoDetailPage(),
                    ),
                  );
                },
                child: Text(
                  "See Details",
                  style: GoogleFonts.inter(
                      decoration: TextDecoration.underline,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: PRIMARY_GREEN),
                ),
              ),
            ),

          ),
        );
      }, separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.white,
        );
    },
    );
  }
}

class TicketCheckOutBar extends StatelessWidget {
  const TicketCheckOutBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromRGBO(34, 34, 34, 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: PRIMARY_GREEN),
            ),
            SizedBox(width: 10),
            Text(
              "Availible",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: PRIMARY_GREEN),
            ),
            SizedBox(width: 30),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color.fromRGBO(255, 122, 0, 1.0),
              ),
            ),
            SizedBox(width: 5),
            Text(
              "Filling Fast",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 122, 0, 1.0),
              ),
            ),
            SizedBox(width: 30),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color.fromRGBO(255, 0, 184, 1.0),
              ),
            ),
            SizedBox(width: 5),
            Text(
              "Almost Full",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(255, 0, 184, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieType extends StatelessWidget {
  const MovieType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 49,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              "2D",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 49,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              "3D",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 95,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
          child: Center(
            child: Text(
              "3D IMAX",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 95,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey),
          child: Center(
            child: Text(
              "3D DBOX",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
