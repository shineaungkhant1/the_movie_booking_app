import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class BookingDateTimeStatusView extends StatelessWidget {

  final Color statusColor;
  final String statusText;
  final String statusIcon;
  final double iconWidth;
  final double iconHeight;

  BookingDateTimeStatusView(
      this.statusColor,
      this.statusText,
      this.statusIcon,
      this.iconWidth,
      this.iconHeight
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: iconWidth,
            height: iconHeight,
            child: Image.asset(statusIcon)),
        SizedBox(width: MARGIN_MEDIUM,),
        Text(statusText,style: TextStyle(
          color: statusColor,
          fontSize: TEXT_REGULAR_1X,
          fontWeight: FontWeight.w500

        ),)
      ],
    );
  }
}
