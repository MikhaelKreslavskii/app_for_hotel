import 'package:flutter/material.dart';

class HotelRating extends StatelessWidget {
  final rating;
  final descrRating;
  const HotelRating({required this.rating, required this.descrRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color.fromARGB((255 / 5).toInt(), 255, 199, 0),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
              child: Image.asset(
                "lib/assets/icons/star.png",
                scale: 1.1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: Text(
                "${rating} ${descrRating}",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 168, 0), fontSize: 16),
              ),
            )
          ]),
    );
  }
}
