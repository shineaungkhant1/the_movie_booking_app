import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/moive_search.dart';
import 'package:the_movie_booking_app/pages/tickets_page.dart';

import '../resources/colors.dart';
import 'bottom_nav_bar.dart';
import 'cinema.dart';
import 'movie_view.dart';

class MovieView extends StatefulWidget {

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> with SingleTickerProviderStateMixin {

  
  late TabController controller;
  int currentIndex=0;
  
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {
        currentIndex = controller.index;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: STARTING_APP_BG_COLOR,
        leading: Image(
          image: AssetImage('assets/images/locationWhite.png'),
          alignment: Alignment.centerRight,
        ),
        title: Text(
          "Yangon",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>MovieSearchPage(currentIndex: currentIndex))
              );
            },
            child: Container(
              // width: 30,
              //  height: 30,
              child:Icon(
                  Icons.search
              ),
            ),
          ),
          SizedBox(width: 25),
          Container(
            // width: 30,
            // height: 30,
            child: Icon(
                Icons.notifications
            ),
          ),
          SizedBox(width: 25),
          Container(
            // width: 30,
            //  height: 30,
            child: Icon(
                Icons.qr_code_scanner
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              BannerSectionView(),
              SizedBox(height: 10),
              NowShowingAndCommingSoonTabBar(controller: controller)
            ]),
          ),
        ],
      ),
    );
  }

}
