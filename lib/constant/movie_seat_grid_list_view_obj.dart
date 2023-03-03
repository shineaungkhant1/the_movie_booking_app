

import '../resources/string.dart';

class MovieSeatGridListViewObject{


  String title = "";
  String type = "";

  MovieSeatGridListViewObject(
  {
    this.title = "",
    this.type = ""
}
      );

  bool isMovieSeatAvailable(){
    return type == SEAT_TYPE_AVAILABLE;
  }

  bool isMovieSeatTaken(){
    return type == SEAT_TYPE_TAKEN;
  }

  bool isMovieSeatRowTitle(){
    return type == SEAT_TYPE_TEXT;
  }

  bool isMovieSeatYourSelection(){
    return type == SEAT_TYPE_SELECTION;
  }

  bool isMovieSeatGoldTaken(){
    return type == SEAT_TYPE_GOLD_TAKEN;
  }


  bool isMovieSeatGoldAvailable(){
    return type == SEAT_TYPE_GOLD_AVAILABLE;
  }

  bool isMovieSeatGoldYourSelection(){
    return type == SEAT_TYPE_GOLD_SELECTION;
  }

}