import 'package:flutter/material.dart';

class Beverage extends StatefulWidget {
  const Beverage({Key? key}) : super(key: key);

  @override
  State<Beverage> createState() => _BeverageState();
}

class _BeverageState extends State<Beverage> {
  bool isShow=true;
  List<String> foodTitle = [
    "Large Pepsi",
    "Large Cocacola"
  ];

  List<String> imagesUrl = [
    "food_images/pepsi.png",
    "food_images/cola.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 70),
        child: GridView.builder(
          padding: EdgeInsets.only(top: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.3 / 3.8,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
          ),
          itemCount: foodTitle.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(102, 102, 102, 0.8),
                    Color.fromRGBO(51, 51, 51, 0.4)
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage(
                        imagesUrl[index],
                      ),
                      height: 100,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodTitle[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "5000 KS",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isShow = !isShow;
                      });
                    },
                    child: isShow?Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14
                          ),
                        ),
                      ),
                    ):
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 10,
                            child: Icon(
                              Icons.add,size: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "1",style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w700
                          ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 10,
                            child: Icon(
                              Icons.remove_rounded,size: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}
