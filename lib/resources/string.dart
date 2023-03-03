
import '../constant/filter_obj.dart';
import '../constant/movie_seat_grid_list_view_obj.dart';
import '../constant/movie_seat_list_view_obj.dart';

const LOGIN_SCREEN_TEXT_1="Verify Your Phone Number";
const LOGIN_SCREEN_TEXT_2="We will send 6-digit sms code to verify your phone number";
const OTP_TEXT_1="We've sent OTP Code";
const OTP_TEXT_2="Please enter 6-digit OTP code that sent to your phone number.";


const String SEAT_TYPE_AVAILABLE = "available";
const String SEAT_TYPE_TAKEN = "taken";
const String SEAT_TYPE_TEXT = "text";
const String SEAT_TYPE_EMPTY = "space";
const String SEAT_TYPE_SELECTION = "selection";
const String SEAT_TYPE_GOLD_TAKEN = "goldTaken";
const String SEAT_TYPE_GOLD_AVAILABLE = "goldAvailable";
const String SEAT_TYPE_GOLD_SELECTION = "goldSelection";


var showMovieSeatList = <MovieSeatListViewObj>[

  MovieSeatListViewObj("Normal(4500ks)",showNormalSeatObject),
  MovieSeatListViewObj("Executive(6500ks)",showExecutiveSeatObject),
  MovieSeatListViewObj("Premium(8500ks)",showPremiumSeatObject),
  MovieSeatListViewObj("Gold(10000ks)", showGoldSeatObject)
];
var showNormalSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "A", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "A", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "B", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "B", type : SEAT_TYPE_TEXT),
];
var showExecutiveSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "C", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "C", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "D", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "D", type : SEAT_TYPE_TEXT),
];
var showPremiumSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "E", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_SELECTION),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_SELECTION),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "E", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title : "F", type : SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title : "F", type : SEAT_TYPE_TEXT),
];
var showGoldSeatObject = <MovieSeatGridListViewObject>[
  MovieSeatGridListViewObject(title: "G", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_AVAILABLE),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_AVAILABLE),


  MovieSeatGridListViewObject(title: "G", type: SEAT_TYPE_TEXT),

  MovieSeatGridListViewObject(title: "H", type: SEAT_TYPE_TEXT),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),
  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_TAKEN),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_EMPTY),

  MovieSeatGridListViewObject(title: "", type : SEAT_TYPE_GOLD_TAKEN),


  MovieSeatGridListViewObject(title: "H", type: SEAT_TYPE_TEXT),
];

const PRICE_RANGE_TEXT = "Price Range";
const PRICE_START_RANGE = "3500Ks";
const PRICE_END_RANGE = "29500Ks";

const SHOW_TIMES_TEXT ="Show Times";
const SHOW_TIMES_START_RANGE ="8am";
const SHOW_TIMES_END_RANGE ="12pm";

var filterObjList = <FilterObj>[
  FilterObj(['Facilities','Parking','Online Food','Wheel Chair']),
  FilterObj(['Format','2D','3D','3D IMAX'])
];

var filterObjListForNowShowing = <FilterObj>[
  FilterObj(['Genres','Action','Adventure','Comedy','Drama','Horror','Science Fiction','Romance','Thriller','Fantasy']),
  FilterObj(['Format','2D','3D','3D IMAX'])
];

var filterObjListForComingSoon = <FilterObj>[
  FilterObj(['Genres','Action','Adventure','Comedy','Drama','Horror','Science Fiction','Romance','Thriller','Fantasy']),
  FilterObj(['Format','2D','3D','3D IMAX']),
  FilterObj(['Month','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'])
];