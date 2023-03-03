import 'package:flutter/material.dart';


import '../resources/dimens.dart';

class ProfileListItemView extends StatelessWidget {
  final String titleLabel;
  final String iconLinkLabel;
  Function onTapTicketItem;

  ProfileListItemView(this.titleLabel,this.iconLinkLabel,this.onTapTicketItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTapTicketItem(),
      child: Container(
        height: 55,
        margin: EdgeInsets.only(bottom: MARGIN_SMALL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
         // border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.25),width: 1),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: MARGIN_CARD_MEDIUM_2,right: MARGIN_SMALL),
                  width: 20,
                  height: 20,
                  child: Image.asset(iconLinkLabel),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(titleLabel,style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: TEXT_REGULAR_1X
                  ),),
                ),
                Spacer(),
                Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
                  child: Image.asset("assets/icons/ic_next_grey.png"),
                )
              ],
            ),
            const SizedBox(height: 2,),
            const Divider(color: Color.fromRGBO(255, 255, 255, 0.1),)
          ],
        ),
      ),
    );
  }
}
