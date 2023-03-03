import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/bottom_nav_bar.dart';
import 'package:the_movie_booking_app/resources/colors.dart';


class PickRegions extends StatelessWidget {

final List<String> cityList=["Yangon","Mandalay","Naypyidaw","Bago","Mawlamyine"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(height: 70),
              Text(
                "Pick Region",style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20),
              SearchLocationBarAndButton(),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                    image:AssetImage('assets/images/cities.png'),width:91.22 ,height:51.68,
                ),
              ),
              Container(

                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(59, 59, 59, 1.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:22 ,right:300 ,top:11 ,bottom:11 ),
                  child: Text(
                    "Cities",style:TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(_,int index)=>listCities(this.cityList[index]),
                  itemCount: this.cityList.length,
                ),
              )
            ],
          ),
        ),
      ));
  }
}

class listCities extends StatelessWidget{

  String cityNames;
  listCities(this.cityNames);

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: STARTING_APP_BG_COLOR,
      child: Container(
        padding: EdgeInsets.only(top: 20,left: 23,bottom: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cityNames,style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),)
          ],
        ),
      ),
    );
  }
  
}

class SearchLocationBarAndButton extends StatelessWidget {
  const SearchLocationBarAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient:LinearGradient(
                  begin:Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:[
                    Color.fromRGBO(102, 102, 102, 0.8),
                    Color.fromRGBO(85, 85, 85, 0.4),
                    Color.fromRGBO(85, 85, 85, 0.4)
                  ]
                )
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  focusedBorder: InputBorder.none,
                  hintText: "Search your location",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(158, 158, 158, 1.0),
                    fontSize: 14,
                  ),
                ),
              ),
            )
          ),
          SizedBox(width: 10),
          LocationButton((){
            Navigator.push(context, MaterialPageRoute(
                builder:(context)=> BottomNavBar()));
          }),
        ],
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
 final Function onTapLocationButton;


 LocationButton(this.onTapLocationButton);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapLocationButton();
      },
      child: TextButton(
        onPressed: () {
          onTapLocationButton();
        },
        child: Container(
          width: 50,
          height: 50,
          child: Image(
            image: AssetImage('assets/images/location.png'),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.green
          ),
        ),
      ),
    );
  }
}
