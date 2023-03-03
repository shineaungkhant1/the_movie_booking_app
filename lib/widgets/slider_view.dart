import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class SliderView extends StatefulWidget {
  @override
  SliderWidgetState createState() => new SliderWidgetState();
}

class SliderWidgetState extends State{

  int valueHolder = 10;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            children: [
              Container(
                height: 5,
                  margin: EdgeInsets.only(top: MARGIN_MEDIUM_3),
                  child: Slider(
                      value: valueHolder.toDouble(),
                      min: 1,
                      max: 100,
                      divisions: 10,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      label: '${valueHolder.round()}',
                      onChanged: (double newValue) {
                        setState(() {
                          valueHolder = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '${newValue.round()}';
                      }
                  ),),
              Text('', style: TextStyle(fontSize: 22),//$valueHolder
              )

            ]
        ));
  }
}