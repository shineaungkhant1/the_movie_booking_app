import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

class TimeRangeSliderExample extends StatefulWidget {
  @override
  _TimeRangeSliderExampleState createState() => _TimeRangeSliderExampleState();
}

class _TimeRangeSliderExampleState extends State<TimeRangeSliderExample> {
  DateTime _minTime = DateTime.now().subtract(Duration(hours: 2));
  DateTime _maxTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RangeSlider(
            values: RangeValues(
              _minTime.millisecondsSinceEpoch.toDouble(),
              _maxTime.millisecondsSinceEpoch.toDouble(),
            ),
            min: DateTime.now().subtract(Duration(hours: 24)).millisecondsSinceEpoch.toDouble(),
            max: DateTime.now().millisecondsSinceEpoch.toDouble(),
            onChanged: (RangeValues values) {
              setState(() {
                _minTime = DateTime.fromMillisecondsSinceEpoch(values.start.toInt());
                _maxTime = DateTime.fromMillisecondsSinceEpoch(values.end.toInt());
              });
            },
            divisions: 48,
            labels: RangeLabels(
              DateFormat('h:mm a').format(_minTime),
              DateFormat('h:mm a').format(_maxTime),
            ),
            activeColor: PRIMARY_GREEN,
            inactiveColor: Color.fromRGBO(136, 136, 136, 1),
          ),
        ],
      ),
    );
  }
}
