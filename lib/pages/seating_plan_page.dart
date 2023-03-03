import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/food_page.dart';
import '../constant/movie_seat_grid_list_view_obj.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/string.dart';
import '../widgets/booking_date_time_status_view.dart';
import '../widgets/clip_button.dart';
import '../widgets/my_clipper.dart';
import '../widgets/slider_view.dart';

class SeatingPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: STARTING_APP_BG_COLOR,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.65,
             child: Container(
                // height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      TitleImageView(),
                      SeatListView(),
                    ],
                  ),
                ),
              )
          ),
          Container(
           // height: MediaQuery.of(context).size.height*0.35,
           // color: PRIMARY_COLOR,
            child: Column(
              children: const [
                SeatColorSpecificationsView(),
                SeekBarView(),
                TotalTicketView()
              ],
            ),
          )
        ],
      )
    );
  }
}

class SeatColorSpecificationsView extends StatelessWidget {
  const SeatColorSpecificationsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(34, 34, 34, 1),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          AvailiableView(),
          Spacer(),
          TakenView(),
          Spacer(),
          SelectionView(),
        ],
      ),
    );
  }
}

class TotalTicketView extends StatelessWidget {
  const TotalTicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3, bottom: MARGIN_MEDIUM_3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "2 Tickets",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "17000KS",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_4X,
                        fontWeight: FontWeight.w600,
                        color: PRIMARY_GREEN),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _navigateToSnackPage(context);
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      right: MARGIN_MEDIUM_3, bottom: MARGIN_MEDIUM_3),
                  //  margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                  child: ClipButton(
                    clipper: MyClipper(holeRadius: 20),
                    shadow: const Shadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0.5, 0.5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 20, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: PRIMARY_GREEN,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Buy Ticket",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class SeekBarView extends StatelessWidget {
  const SeekBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          SliderView(),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.remove,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class SeatListView extends StatelessWidget {
  const SeatListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: showMovieSeatList.length,
        itemBuilder: (BuildContext context, int index) {
          //
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MARGIN_CARD_MEDIUM_2,
              ),
              PriceTextView(showMovieSeatList[index].seatingArrangement),
              SizedBox(
                height: MARGIN_CARD_MEDIUM_2,
              ),
              SeatView(showMovieSeatList[index].movieSeatGridListViewObj)
            ],
          );
        });
  }
}

class TitleImageView extends StatelessWidget {
  const TitleImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/ellipse.png",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "SCREEN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class SeatView extends StatelessWidget {
  List<MovieSeatGridListViewObject> movieSeatGridListViewObj =
      <MovieSeatGridListViewObject>[];

  SeatView(this.movieSeatGridListViewObj);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 11, // number of columns
          mainAxisSpacing: 10, // vertical space between items
          crossAxisSpacing: 10, // horizontal space between items
          childAspectRatio: 1, // aspect ratio of each item
        ),
        // umber of items in the grid
        itemBuilder: (BuildContext context, int index) {
          if (movieSeatGridListViewObj[index].type == SEAT_TYPE_TEXT) {
            return Text(
              movieSeatGridListViewObj[index].title.toString(),
              style: TextStyle(color: Colors.white),
            );
          } else if (movieSeatGridListViewObj[index].type == SEAT_TYPE_EMPTY) {
            return SizedBox(
              width: 10,
            );
          } else if (movieSeatGridListViewObj[index].type ==
              SEAT_TYPE_AVAILABLE) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_available.png"),
            );
          } else if (movieSeatGridListViewObj[index].type == SEAT_TYPE_TAKEN) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_taken.png"),
            );
          } else if (movieSeatGridListViewObj[index].type ==
              SEAT_TYPE_SELECTION) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_available.png",
                color: PRIMARY_GREEN,),
            );
          } else if (movieSeatGridListViewObj[index].type ==
              SEAT_TYPE_GOLD_AVAILABLE) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_couple_seat_available.png"),
            );
          } else if (movieSeatGridListViewObj[index].type ==
              SEAT_TYPE_GOLD_TAKEN) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_couple_seat_taken.png"),
            );
          } else {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_your_selection.png"),
            );
          }
        },
        itemCount: movieSeatGridListViewObj.length,
        // n
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class PriceTextView extends StatelessWidget {
  String priceText = "";

  PriceTextView(this.priceText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        child: Text(
          priceText,
          style: const TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(136, 136, 136, 1)),
        ),
      ),
    );
  }
}

class AvailiableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Availiable", "assets/icons/ellipse_white.png", 8.0, 8.0);
  }
}

class TakenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Taken", "assets/icons/ellipse_grey.png", 8.0, 8.0);
  }
}

class SelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Your Selection", "assets/icons/ellipse_green.png", 8.0, 8.0);
  }
}

Future<dynamic> _navigateToSnackPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FoodPage(),
    ),
  );
}
