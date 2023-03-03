import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/movie_details.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/comming_soon_movie_view.dart';
import 'package:the_movie_booking_app/widgets/now_showing_movie_view.dart';

import '../constant/filter_obj.dart';
import '../resources/dimens.dart';
import '../resources/string.dart';
import '../widgets/filter_dropdown_view.dart';
import '../widgets/movie_item_view.dart';

class MovieSearchPage extends StatefulWidget {

  late int currentIndex ;

  MovieSearchPage({required this.currentIndex});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  List<String> genreList = [
    'Genres','Action','Adventure','Comedy','Drama','Horror','Science Fiction','Romance','Thriller','Fantasy'
  ];
  String selectedGenre = 'Genres';

  List<String> formatList = [
    'Format','2D','3D','3D IMAX'
  ];
  String selectedFormat = 'Format';

  List<String> monthList = [
    'Month','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ];
  String selectedMonth = 'Month';

  late bool _isShow ;

  bool showMovieList=false;

  @override
  void initState() {
    if(widget.currentIndex == 0){
      setState(() {
        _isShow=false;
      });
    }else if(widget.currentIndex == 1 ){
      setState(() {
        _isShow=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      appBar: AppBar(
        backgroundColor: STARTING_APP_BG_COLOR,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left)),
        title: Row(
          children: [
            SearchBoxView(showCinema: (){
              setState(() {
                showMovieList=true;
              });
            })
          ],
        ),
        actions: [
          FilterButtonView()
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                    height: 35,
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MARGIN_MEDIUM)
                    ),
                    child: DropdownButton<String>(
                      underline: Container(),
                      dropdownColor: Colors.white,
                      value: selectedGenre,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black, //
                        ),
                      ),
                      items: genreList
                          .map(
                            (code) => DropdownMenuItem<String>(
                          value: code,
                          child: Text(
                            code,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (code) => setState(() => selectedGenre = code!),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                    height: 35,
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MARGIN_MEDIUM)
                    ),
                    child: DropdownButton<String>(
                      underline: Container(),
                      dropdownColor: Colors.white,
                      value: selectedFormat,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black, //
                        ),
                      ),
                      items: formatList
                          .map(
                            (code) => DropdownMenuItem<String>(
                          value: code,
                          child: Text(
                            code,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      )
                          .toList(),
                      onChanged: (format) => setState(() => selectedFormat = format!),
                    ),
                  ),
                  Visibility(
                    visible: _isShow,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                      height: 35,
                      decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MARGIN_MEDIUM)
                      ),
                      child: DropdownButton<String>(
                        underline: Container(),
                        dropdownColor: Colors.white,
                        value: selectedMonth,
                        icon: const Padding(
                          padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.black, //
                          ),
                        ),
                        items: monthList
                            .map(
                              (code) => DropdownMenuItem<String>(
                            value: code,
                            child: Text(
                              code,
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        )
                            .toList(),
                        onChanged: (month) => setState(() => selectedMonth = month!),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              showMovieList?Container(height: 565,child: _isShow?CommingSoonMovieView():NowShowingMovieView()):Container(),
            ],
          ),
        ),
      )
    );
  }
}

class FilterButtonView extends StatelessWidget {
  const FilterButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/icons/ic_filter.png",
          color: PRIMARY_GREEN,
          // scale: 4,
        ),
      ),
    );
  }
}

class SearchBoxView extends StatelessWidget {
  late final Function showCinema;


  SearchBoxView({required this.showCinema});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.search_rounded),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
              padding: EdgeInsets.only(right: 20.0), child: ClearText(showMovie: showCinema)),
        ),
      ],
    );
  }
}

class ClearText extends StatefulWidget {
 late final Function showMovie;

 ClearText({required this.showMovie});

 @override
  State<ClearText> createState() => _ClearTextState();
}

class _ClearTextState extends State<ClearText> {
  TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    setState(() {
      _controller.clear();
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (show){
        widget.showMovie();
      },
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'search the cinema',
        hintStyle: TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),

        border: InputBorder.none,
        //  fillColor: Colors.white,
        filled: true,
        suffixIcon: _hasText
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: _clearText,
              )
            : null,
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
