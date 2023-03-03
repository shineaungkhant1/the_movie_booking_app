import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/string.dart';

class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _minValue = 3500;
  double _maxValue = 20000;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: const [
            Text(PRICE_START_RANGE,style: TextStyle(
                color: SLIDER_RANGE_TEXT_COLOR,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500
            ),),
            Spacer(),
            Text(PRICE_END_RANGE,style: TextStyle(
                color: SLIDER_RANGE_TEXT_COLOR,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
        RangeSlider(
          values: RangeValues(_minValue, _maxValue),
          min: 3500,
          max: 29500,
          onChanged: (RangeValues values) {
            setState(() {
              _minValue = values.start;
              _maxValue = values.end;
            });
          },
          divisions: 500,
          labels: RangeLabels(
            _minValue.toInt().toString(),
            _maxValue.toInt().toString(),
          ),
          activeColor: SLIDER_RANGE_ACTIVE_COLOR,
          inactiveColor: SLIDER_RANGE_INACTIVE_COLOR,
        ),
      ],
    );
  }
}
