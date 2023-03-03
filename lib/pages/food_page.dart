import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/check_out.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/beverage.dart';
import 'package:the_movie_booking_app/widgets/combo.dart';
import 'package:the_movie_booking_app/widgets/foods.dart';
import 'package:the_movie_booking_app/widgets/pop_corn.dart';
import 'package:the_movie_booking_app/widgets/snack.dart';
import 'package:badges/badges.dart' as badges;

class FoodPage extends StatefulWidget {
  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

   bool isShow=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: STARTING_APP_BG_COLOR,
        leading: const Icon(Icons.arrow_back_ios_rounded),
        title: const Text(
          "Grab a bite!",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "SKIP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      body: Stack(
        children:[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FoodCategoryAndFoodList(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight:Radius.circular(30),topLeft: Radius.circular(30)),
                color: STARTING_APP_BG_COLOR,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: isShow,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Large Cocola",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                              child: Icon(
                                Icons.add,size: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1",style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                              child: Icon(
                                Icons.remove_rounded,size: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1000Ks",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Large Cocola",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                              child: Icon(
                                Icons.add,size: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1",style: TextStyle(
                                color: Colors.green,
                                fontSize: 15,
                                fontWeight: FontWeight.w700
                            ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 10,
                              child: Icon(
                                Icons.remove_rounded,size: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1000Ks",style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration:BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ) ,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        badges.Badge(
                          position: badges.BadgePosition.topEnd(),
                          badgeContent: Text(
                            "1",style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                          child: Container(
                            width: 35,
                            child:Image(
                              image: AssetImage(
                                  'assets/images/cup.png'
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },icon:isShow ? Icon(
                            Icons.keyboard_arrow_up
                        ):Icon(
                            Icons.keyboard_arrow_down
                        ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => CheckOut()
                                )
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                "2000Ks",style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              ),
                              Icon(
                                  Icons.keyboard_arrow_right
                              ),
                              SizedBox(width: 15),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]
      ),

    );
  }
}

class FoodCategoryAndFoodList extends StatelessWidget {
  const FoodCategoryAndFoodList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: const [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.green,
            tabs: [
              Tab(
                child: Text("All"),
              ),
              Tab(
                child: Text("Combo"),
              ),
              Tab(
                child: Text("Snack"),
              ),
              Tab(
                child: Text("Pop Corn"),
              ),
              Tab(
                child: Text("Beverage"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                Foods(),
                Combo(),
                Snacks(),
                PopCorn(),
                Beverage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
