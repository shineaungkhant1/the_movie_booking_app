import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

class PhoneNumbrAndGoogle extends StatefulWidget {
  final Function onTapPhone;

  @override
  State<PhoneNumbrAndGoogle> createState() => _PhoneNumbrAndGoogleState();

  PhoneNumbrAndGoogle(this.onTapPhone);
}

class _PhoneNumbrAndGoogleState extends State<PhoneNumbrAndGoogle> {
  List<String> countryCode = [
    "+95",
    "+66",
    "+65",
    "+60",
    "+63",
    "+1",
    "+44",
    "+82",
    "+7",
    "+86"
  ];
  String selectedCode = "+95";

  late String errorMessage="";



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Country Code",
            style: TextStyle(
              color: Color.fromRGBO(136, 136, 136, 1.0),
              fontSize: 12,
            ),
          ),
        ),
        Row(
          children:[
            DropdownButton<String>(
              value: selectedCode,
              items: countryCode
                  .map(
                    (code) => DropdownMenuItem<String>(
                  value: code,
                  child: Text(
                    code,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
                  .toList(),
              onChanged: (code) => setState(() => selectedCode = code!),
              dropdownColor: STARTING_APP_BG_COLOR,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                  isDense: true,
                  hintText: "Mobile Number",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(136, 136, 136, 1.0),
                    fontSize: 16,
                  )
                ),
                onChanged: (text){
                  if(text.startsWith("09") && text.length == 11 ){
                    setState(() {
                      errorMessage="";
                    });
                  } else {
                    setState(() {
                      errorMessage="Please fill correct phone number!!!";
                    });
                  }
                },
              ),
            )
          ]
        ),
        SizedBox(height: 5),
        Text(errorMessage,style: TextStyle(
          fontSize: 14,
          color: Colors.red,
        ),
        ),
        SizedBox(height: 20),
        Container(
          height: 49,
          width: double.infinity,
          child: GestureDetector(
            onTap: () {
              widget.onTapPhone();
            },
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 255, 106, 1.0)),
              onPressed: () {
                widget.onTapPhone();
              },
              child: Text(
                "Verify Your Phone Number",
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.white24,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.white24,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 51,
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              print("Continue With Google");
            },
            child: Row(
              children: [
                SizedBox(width:65 ),
                Image(
                  image: AssetImage('assets/images/google.png'),
                  width: 25,
                ),
                SizedBox(width: 10),
                Text(
                  "Continue With Google",
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
