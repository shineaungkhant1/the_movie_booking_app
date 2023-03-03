import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_movie_booking_app/pages/home_page.dart';
import 'package:the_movie_booking_app/pages/pick_regions.dart';
import 'package:the_movie_booking_app/resources/colors.dart';
import 'package:the_movie_booking_app/resources/string.dart';
import 'package:the_movie_booking_app/widgets/terms_and_conditions.dart';

import '../widgets/c_cinema_image.dart';

class OtpPage extends StatelessWidget {


  FocusNode focusNodeOne = FocusNode();
  FocusNode focusNodeTwo = FocusNode();
  FocusNode focusNodeThree = FocusNode();
  FocusNode focusNodeFour = FocusNode();
  FocusNode focusNodeFive = FocusNode();
  FocusNode focusNodeSix = FocusNode();





  @override
  Widget build(BuildContext context) {
    List<FocusNode> focusNodeList = [focusNodeOne,focusNodeTwo,focusNodeThree,focusNodeFour,focusNodeFive,focusNodeSix];
    return Scaffold(
      backgroundColor: STARTING_APP_BG_COLOR,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              children: [
                CCinemaImage(),
                OtpText1(),
                SizedBox(height: 10),
                OtpText2(),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Enter OTP Code",
                        style: TextStyle(
                          color: LOGIN_SCREEN_TEXT_AND_OTP_COLOR2,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      OTPBox(focusNodeList: focusNodeList),
                    ],
                  ),
                ),
               SizedBox(height: 25),
                OTPResendButton(),
                SizedBox(height: 20,),
                Container(
                  padding:EdgeInsets.symmetric(horizontal: 30) ,
                  width: double.infinity,
                  child:OtpConfirmButton((){
                   Navigator.push(context, MaterialPageRoute(
                       builder: (context) => PickRegions()));
                  }),
                ),
                SizedBox(height: 120),
                TermsAndConditions(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPResendButton extends StatelessWidget {
  const OTPResendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child:TextButton(
        onPressed: () {
          print("Don't receive OTP? Resend Code Button tap.");
        },
        child: Text(
          "Don't receive OTP? Resend Code",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class OTPBox extends StatelessWidget {
  const OTPBox({
    super.key,
    required this.focusNodeList,
  });

  final List<FocusNode> focusNodeList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:List.generate(6, (index) => SizedBox(
          width: 50,
          child: Container(
            color: Colors.white,
            child: TextField(
              focusNode: focusNodeList[index],
              inputFormatters: [LengthLimitingTextInputFormatter(1),],
              onChanged: (value){
                if(value.isNotEmpty){
                  focusNodeList[index].unfocus();
                  if(index<focusNodeList.length-1){
                    focusNodeList[index + 1].requestFocus();
                  }
                }else if(value.isEmpty){
                  focusNodeList[index].unfocus();
                 if(index>0){
                   focusNodeList[index - 1].requestFocus();
                 }
                }
              },
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              style: TextStyle(
                fontWeight:FontWeight.bold ,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "*",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}

class OtpConfirmButton extends StatelessWidget {
final Function onTapOtpConfirm;

  const OtpConfirmButton(this.onTapOtpConfirm);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapOtpConfirm();
      },
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Color.fromRGBO(0, 255, 106, 1.0)
        ),
        onPressed: () {
          onTapOtpConfirm();
        },
        child: Text(
          "Confirm OTP",
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
      ),
    );
  }
}

class OtpText1 extends StatelessWidget {
  const OtpText1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      OTP_TEXT_1,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    );
  }
}

class OtpText2 extends StatelessWidget {
  const OtpText2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: Text(
        OTP_TEXT_2,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: LOGIN_SCREEN_TEXT_AND_OTP_COLOR2,
        ),
      ),
    );
  }
}
