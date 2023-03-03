import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/booking_page.dart';
import 'package:the_movie_booking_app/pages/bottom_nav_bar.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class MovieDetailsPage extends StatefulWidget {
  bool isShow = true;

  MovieDetailsPage( {required this.isShow});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final List<String> genreList = ["Action", "Adventure", "Drama", "Annimation"];

  List<String> trailerUrl = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                TrailerSection(),
                MovieDetailImage(),
                MovieTitleImbRationg(),
                MovieType(),
                Expanded(
                  child: Positioned(
                    top: 320,
                    left: 178,
                    child: GenreView(genreList: genreList),
                  ),
                ),
                Positioned(
                    top: 60,
                    left: 340,
                    child: Icon(
                      Icons.share,
                      size: 35,
                      color: Colors.white,
                    )),
              ],
            ),
            CensorRatingReleaseDateDuration(),
            SizedBox(height: 20),
            Visibility(
              visible: widget.isShow,
              child: NotiSection(),
            ),
            SizedBox(height: 20),
            StoryLine(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cast",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  CircleImages(),

                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => BookingPage()
              )
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 200,
            height: 70,
            child: Image(
              image: AssetImage('assets/images/BookingBTN.png'),
              fit: BoxFit.fitWidth,
            ),
            /* width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green,
            ),
            child: Stack(
              children:[
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Booking",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                  ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 20,
                    width: 15,
                    decoration: BoxDecoration(
                      color:STARTING_APP_BG_COLOR,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),

                    ),
                  ),
                )
              ]
            ),*/
          ),
        ),
      ),
    );
  }
}

class NotiSection extends StatelessWidget {
  const NotiSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 154,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0.6),
                      Color.fromRGBO(204, 204, 204, 0.6),
                      Color.fromRGBO(221, 221, 221, 0.3),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 290,
              top: 10,
              child: Image(
                image: AssetImage('assets/images/model.png'),
                width: 90,
              ),
            ),
            Positioned(
              top: 10,
              left: 30,
              child: Text(
                "Releasing in 5 days",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 30,
              child: Container(
                width: 222,
                height: 34,
                child: Text(
                  "Get notify as soon as movie booking opens up in your city!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 30,
              child: Container(
                width: 156,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.notifications_active),
                      SizedBox(width: 5),
                      Text(
                        "Set Notification",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CircleImages extends StatefulWidget {
  const CircleImages({Key? key}) : super(key: key);

  @override
  State<CircleImages> createState() => _CircleImagesState();
}

class _CircleImagesState extends State<CircleImages> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var x = 0; x < 10; x++) {
      widgets.add(Stack(children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2,
                  style: BorderStyle.solid,
                  color: STARTING_APP_BG_COLOR),
              borderRadius: BorderRadius.circular(200),
              image: DecorationImage(
                image: NetworkImage(
                    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-179427791-1580485545.jpg?crop=1xw:0.6665776828617191xh;center,top&resize=1200:*"),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
          top: 90,
          left: 15,
          child: Text(
            "Scarlett",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ]));
    }
    return Container(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5),
        children: widgets,
      ),
    );
  }
}

class StoryLine extends StatelessWidget {
  const StoryLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Story Line",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(
            " In 1995, super soldier Alexei Shostakov and Black Widow Melina Vostokoff work as Russian undercover agents, posing as a family in Ohio with Natasha Romanoff and "
            "Yelena Belova as their daughters. They steal S.H.I.E.L.D. intel and escape to Cuba where their boss, General Dreykov, "
            "has Romanoff and Belova taken to the Red Room for training. In the following decades, Shostakov is imprisoned in Russia while Romanoff and Belova become successful,"
            " dangerous assassins. Romanoff eventually defects to S.H.I.E.L.D. after helping Clint Barton bomb Dreykov's Budapest office, which apparently kills Dreykov and his young daughter Antonia.",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          )
        ],
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
    return Positioned(
      top: 300,
      left: 180,
      child: Text(
        "2D,3D,3D MAX,3D DBOX",
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class MovieTitleImbRationg extends StatelessWidget {
  const MovieTitleImbRationg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260,
      left: 180,
      child: Row(
        children: [
          Text(
            "Black Widow",
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 30),
          Image(
            image: AssetImage("now_showing_movie_images/imb.png"),
            width: 35,
            height: 25,
          ),
          Text(
            "7.1",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class MovieDetailImage extends StatelessWidget {
  const MovieDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left: 18,
      child: Image(
        image: AssetImage('now_showing_movie_images/blackwidow.png'),
        width: 140,
        height: 175,
      ),
    );
  }
}

class CensorRatingReleaseDateDuration extends StatelessWidget {
  const CensorRatingReleaseDateDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 65,
            width: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(34, 34, 34, 0.8),
                  Color.fromRGBO(17, 17, 17, 0.6),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Censor Rating",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "U/A",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 58,
            width: 115,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(34, 34, 34, 0.8),
                  Color.fromRGBO(17, 17, 17, 0.6),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Release date",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "May 8th,2022",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 58,
            width: 86,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(34, 34, 34, 0.8),
                  Color.fromRGBO(17, 17, 17, 0.6),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "2hr 15min",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenreView extends StatelessWidget {
  const GenreView({
    Key? key,
    required this.genreList,
  }) : super(key: key);

  final List<String> genreList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: genreList.map((genre) => GenreChipView(genre)).toList(),
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.green,
      label: Text(
        genreText,
        style: TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1.0),
            fontWeight: FontWeight.w500,
            fontSize: 12),
      ),
    );
  }
}

class TrailerSection extends StatelessWidget {
  const TrailerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        VideoPlayerScreen(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: SizedBox(
          width: 400,
          height: 300,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.rollingstone.com/wp-content/uploads/2021/04/BW.jpg?w=910&h=511&crop=1"),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black45, BlendMode.darken),
                  ),
                ),
              ),
              Positioned(
                left: 165,
                top: 80,
                child: Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Positioned(
                  left: 30,
                  top: 10,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BottomNavBar(),
                          ),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
