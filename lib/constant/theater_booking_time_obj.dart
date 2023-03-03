class TheaterBookingTimeObject{

  final String bookingTime; // 12:30PM
  final String movieViewType; // 3D IMAX
  final String screen; // Screen
  final String bookingTimeStatus;
  final String availableCountString;


  TheaterBookingTimeObject(
      this.bookingTime,
      this.movieViewType,
      this.screen,
      this.bookingTimeStatus,
      [this.availableCountString = ""]);



}