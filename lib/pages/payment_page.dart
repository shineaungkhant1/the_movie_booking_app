import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_movie_booking_app/widgets/booking_success_screen.dart';
import 'package:the_movie_booking_app/pages/check_out.dart';
import 'package:the_movie_booking_app/pages/ticket_confirmation.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  List<String> logoList=[
    "payment_images/bump.png",
    "payment_images/gift.png",
    "payment_images/pay.png",
    "payment_images/credit.png",
    "payment_images/redeem.png",
    "payment_images/wallet.png",
    "payment_images/netBanking.png"];

  List<String> paymentNameList=[
    "UPI",
    "Gift Voucher",
    "Quick Pay",
    "Credit Card / Debit Card",
    "Redeem Point",
    "Mobile Wallet",
    "Net Banking",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CheckOut(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 120),
                Text(
                  "Payment",style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30,right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NameField(),
                  SizedBox(height: 20),
                  OfferOrPromo(),
                  SizedBox(height:30),
                  PaymentSelectionTitle(),
                  SizedBox(height: 10),
                  Container(
                    height: 500,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: logoList.length,
                        itemBuilder: (BuildContext contex,int index){
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TicketConformationPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: EdgeInsets.only(left: 10,right: 10),
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white24),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              logoList[index]
                                          ),height: 20,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          paymentNameList[index],
                                          style: GoogleFonts.dmSans(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PaymentSelectionTitle extends StatelessWidget {
  const PaymentSelectionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Choose your payment type",style: GoogleFonts.dmSans(
      color: Colors.green,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    );
  }
}


class GiftVoucher extends StatelessWidget {
  const GiftVoucher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(
                    "payment_images/gift.png"
                ),height: 20,
              ),
              SizedBox(width: 10),
              Text(
                "Gift Voucher",
                style: GoogleFonts.dmSans(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}


class OfferOrPromo extends StatelessWidget {
  const OfferOrPromo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: Row(
          children: [
            Image(
                image:AssetImage(
                  "assets/images/promo.png"
                ),height: 20,
            ),
            SizedBox(width: 15),
            Text(
              "Unlock Offer or Apply Promocode",style: GoogleFonts.dmSans(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameField extends StatelessWidget {
  const NameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 330,
          height: 60,
          child: TextField(
            style:TextStyle(
              color: Colors.green
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white24
                  )
              ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green
                    )
                ),
                labelText: "Your Name",
                labelStyle: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 14
                ),
                hintText: "Enter your name",
                hintStyle: TextStyle(
                    color: Color.fromRGBO(68, 68, 68, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                )
            ),
          ),
        ),
        SizedBox(width:10),
        Text(
            "*",style: TextStyle(
          color: Colors.red
        ),
        )
      ],
    );
  }
}
