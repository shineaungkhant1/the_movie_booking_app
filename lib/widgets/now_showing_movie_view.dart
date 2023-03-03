import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/movie_details.dart';

class NowShowingMovieView extends StatefulWidget {
  @override
  State<NowShowingMovieView> createState() => _NowShowingMovieViewState();
}

class _NowShowingMovieViewState extends State<NowShowingMovieView> {

  List<String> imagesUrl=[
    "now_showing_movie_images/venom.png",
    "now_showing_movie_images/blackwidow.png",
    "now_showing_movie_images/thehows.png",
    "now_showing_movie_images/monkey.png"
  ];

  List<String> movieTitle=[
    "Venom",
    "Black Widow",
    "The Hows",
    "The Monkey"
  ];

  List<String> rating=[
    "9.0","7.1","6.5","5.5"
  ];

  List<String> movieType=[
    "2D,3D,3D IMAX",
    "2D,3D,3D IMAX",
    "2D",
    "2D,3D,3D IMAX"
  ];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MovieDetailsPage(isShow: false),
            )
        );
      },
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 280,
            maxCrossAxisExtent: 250,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: movieTitle.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Stack(
                children:[
                  Positioned.fill(
                    child: Image(
                      image: AssetImage(imagesUrl[index]),fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 45,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.height,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 38, left: 7,
                    child: Container(
                      width: 80,
                      height: 16,
                      child: Text(
                        movieTitle[index],style:TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 35, right: 26,
                      child: Image(
                        image: AssetImage("now_showing_movie_images/imb.png"),width: 32,height: 21,
                      )
                  ),
                  Positioned(
                    bottom: 38, right: 5,
                    child: Container(
                      width: 19,
                      height: 16,
                      child: Text(
                        rating[index],style:TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700
                      ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15, left: 7,
                    child: Container(
                      width: 25,
                      height: 16,
                      child: Text(
                        "U/A",style:TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                      ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20, left: 50,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                         shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                  ),
                  Positioned(
                    bottom: 5,left: 70,
                    child: Container(
                      width: 112,
                      height: 26,
                      child: Text(
                        movieType[index],style:TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400
                      ),
                      ),
                    ),
                  ),
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}
