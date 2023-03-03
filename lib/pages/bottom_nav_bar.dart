import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/cinema.dart';
import 'package:the_movie_booking_app/pages/profile_page.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/comming_soon_movie_view.dart';
import 'package:the_movie_booking_app/widgets/now_showing_movie_view.dart';

import 'movie_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  var  _pages =[
    MovieView(),
    Cinema(),
    TicketsPage(),
    ProfilePage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        backgroundColor: STARTING_APP_BG_COLOR,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: "Movies",
            icon: Icon(Icons.play_arrow),
          ),
          BottomNavigationBarItem(
              label: 'Cinema',
              icon: Image(
                color:_currentIndex == 1 ? Colors.green : null,
                image: AssetImage('assets/images/theater.png'),
                width: 30,
              )),
          BottomNavigationBarItem(
            label: "Ticket",
            icon: Image(
              color:_currentIndex == 2 ? Colors.green : null,
              image: AssetImage('assets/images/ticket.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Image(
              color:_currentIndex == 3 ? Colors.green : null,
              image: AssetImage('assets/images/profile.png'),width: 30,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class NowShowingAndCommingSoonTabBar extends StatefulWidget {

  final TabController controller;


  NowShowingAndCommingSoonTabBar({required this.controller});

  @override
  State<NowShowingAndCommingSoonTabBar> createState() =>
      _NowShowingAndCommingSoonTabBarState();
}

class _NowShowingAndCommingSoonTabBarState
    extends State<NowShowingAndCommingSoonTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(68, 68, 68, 0.5),
                      Color.fromRGBO(217, 217, 217, 0.25),
                    ],
                  ),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 8, bottom: 7, right: 10),
                  child: TabBar(
                    controller: widget.controller,
                    indicator: BoxDecoration(color: Colors.green),
                    unselectedLabelColor: Color.fromRGBO(136, 136, 136, 1.0),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    labelStyle: TextStyle(
                        color: Color.fromRGBO(85, 85, 85, 1.0),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                    tabs: [
                      Tab(
                        child: Text("Now Showing"),
                      ),
                      Tab(
                        child: Text("Comming Soon"),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 565,
                child: TabBarView(
                  controller: widget.controller,
                  children: [NowShowingMovieView(), CommingSoonMovieView()],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class BannerSectionView extends StatefulWidget {
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  List<String> imagesUrl = [
    "assets/images/kfc.png",
    "assets/images/kfc.png",
    "assets/images/kfc.png",
    "assets/images/kfc.png",
  ];

  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 2,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, page) {
              setState(() {
                _position = index.toDouble();
              });
            },
          ),
          itemCount: imagesUrl.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final imageUrl = imagesUrl[index];
            return buildImage(imageUrl, index);
          },
        ),
        SizedBox(height: 16),
        DotsIndicator(
          dotsCount: imagesUrl.length,
          position: _position,
          decorator: DotsDecorator(
            color: Color.fromRGBO(50, 50, 50, 1.0),
            activeColor: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget buildImage(String imageUrl, int index) {
    return Container(
      child: Image(
        image: AssetImage(imageUrl),
      ),
    );
  }
}
