
import 'movie_seat_grid_list_view_obj.dart';

class MovieSeatListViewObj {
  String seatingArrangement = "";
  List<MovieSeatGridListViewObject> movieSeatGridListViewObj =
      <MovieSeatGridListViewObject>[];

  MovieSeatListViewObj(this.seatingArrangement, this.movieSeatGridListViewObj);
}
