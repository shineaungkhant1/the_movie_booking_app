import 'package:flutter/material.dart';
import 'package:the_movie_booking_app/resources/colors.dart';

import '../resources/dimens.dart';

class MovieItemView extends StatelessWidget {
  final bool uiChangeFlag;
  final Function onTapItemView;

  MovieItemView(this.uiChangeFlag, this.onTapItemView);
// ()=> Navigator.pop(context),
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItemView(),
      child: Container(
        width: 171,
        margin: EdgeInsets.only(right: MARGIN_MEDIUM),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: MovieItemImageView(),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: GradientView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Venom II",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        SizedBox(
                            height: 30,
                            child: Image.asset('assets/images/ic_imbd.png')),
                        const Text(
                          "9.0",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "U/A",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Container(
                            height: 8,
                            child: Image.asset('assets/images/ic_dot.png'),
                          ),
                        ),
                        const Text(
                          "2D,3D,3D IMAX",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Visibility(
              visible: !uiChangeFlag,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                      color: PRIMARY_GREEN,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Center(
                    child: Text(
                      "8th\nAUG",
                      style: TextStyle(
                          fontSize: TEXT_REGULAR,
                          color: Color.fromRGBO(85, 85, 85, 1),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class MovieItemImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Image.asset(
        "assets/images/sample_grid_img_2.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class GradientView extends StatelessWidget {
  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(68, 68, 68, 0),
            Color.fromRGBO(68, 68, 68, 0),
            Color.fromRGBO(0, 0, 0, 1),
          ],
        ),
      ),
    );
  }
}
