import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/pages/cinema.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/widgets/filter_dropdown_view.dart';

import '../resources/dimens.dart';
import '../resources/string.dart';
import '../widgets/price_range_slider.dart';
import '../widgets/time_range_slider_view.dart';
import 'booking_page.dart';

class CinemaSearchPage extends StatefulWidget {
  const CinemaSearchPage({Key? key}) : super(key: key);

  @override
  State<CinemaSearchPage> createState() => _CinemaSearchPageState();
}

class _CinemaSearchPageState extends State<CinemaSearchPage> {

   bool showCinemaList=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      appBar: AppBar(
        backgroundColor: STARTING_APP_BG_COLOR,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left)),
        title: SearchBoxView(showCinema:(){
          setState(() {
            showCinemaList=true;
          });
        }),
        actions: [
          FilterButtonView(),
        ],
      ),
      body: Container(
        color: STARTING_APP_BG_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                   FilterDropdown(),
                   SizedBox(
                    height: 20,
                  ),
                   PriceRangeSectionView(),
                   SizedBox(
                    height: 20,
                  ),
                   TimeRangeSectionView(),
                   SizedBox(
                    height: 20,
                  ),
                  showCinemaList?CinemasAndShowTimes():Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ClearText extends StatefulWidget {
    late final Function showCinema;


    ClearText({required this.showCinema});

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
    return  TextField(
      onSubmitted:(show){
        print(show);
        widget.showCinema();
      } ,
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'search here',
        hintStyle:
        TextStyle(color: Color.fromRGBO(136, 136, 136, 1)),

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
              padding: EdgeInsets.only(right: 20.0), child: ClearText(showCinema:showCinema)),
        ),
      ],
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

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_3),
      child: Wrap(
        spacing: 4.0, // spacing between adjacent chips
        // runSpacing: 1.0,
        direction: Axis.horizontal,
        children: filterObjList
            .map(
              (filterItem) => FilterDropdownView(filterItem.filterArrayList),
            )
            .toList(),
      ),
    );
  }
}

class PriceRangeSectionView extends StatelessWidget {
  const PriceRangeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_3),
          child: const Text(
            PRICE_RANGE_TEXT,
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        PriceRangeSliderSectionView(),

      ],
    );
  }
}

class PriceRangeSliderSectionView extends StatefulWidget {
  const PriceRangeSliderSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<PriceRangeSliderSectionView> createState() =>
      _PriceRangeSliderSectionViewState();
}

class _PriceRangeSliderSectionViewState
    extends State<PriceRangeSliderSectionView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
        child: PriceRangeSlider());
  }
}

class TimeRangeSectionView extends StatelessWidget {
  const TimeRangeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:  EdgeInsets.only(left: MARGIN_MEDIUM_3),
          child:  Text(
            SHOW_TIMES_TEXT,
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            margin: const EdgeInsets.only(
                left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
            child: TimeRangeSliderView())
      ],
    );
  }
}

class CinemaFilterListSectionView extends StatelessWidget {
  const CinemaFilterListSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          CinemasAndShowTimes(),
        ],
      ),
    );
  }
}
