import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/string.dart';

class TimeRangeSliderView extends StatefulWidget {
  @override
  _TimeRangeSliderViewState createState() => _TimeRangeSliderViewState();
}

class _TimeRangeSliderViewState extends State<TimeRangeSliderView> {
  double _minValue = 8.0;
  double _maxValue = 12.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children:  [
            Text(
              SHOW_TIMES_START_RANGE,
              style: TextStyle(
                  color: SLIDER_RANGE_TEXT_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Text(
              SHOW_TIMES_END_RANGE,
              style: TextStyle(
                  color: SLIDER_RANGE_TEXT_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        RangeSlider(
          min: 8.0,
          max: 12.0,
          divisions: 8,
          labels: RangeLabels(
            '${_minValue.toInt()}am',
            '${_maxValue.toInt()}pm',
          ),
          values: RangeValues(_minValue, _maxValue),
          onChanged: (RangeValues newValues) {
            setState(() {
              _minValue = newValues.start;
              _maxValue = newValues.end;
            });
          },
          activeColor: SLIDER_RANGE_ACTIVE_COLOR,
          inactiveColor: SLIDER_RANGE_INACTIVE_COLOR,
        ),
      ],
    );
  }
}
