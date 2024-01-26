import 'package:flutter/material.dart';
import 'package:hotel_app/components/hotel_components/hotel_parametrs_list.dart';
import 'package:hotel_app/components/hotel_components/hotel_peculiarities_tile.dart';

import '../../models/hotel.dart';

class HotelSecondWidget extends StatelessWidget {
  final Hotel hotel;
  const HotelSecondWidget({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              "Об отеле",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(children: [
                for (var i in hotel.peculiarities) HotelTile(perculat: i),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8, right: 16),
            child: Text(
              "${hotel.description}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF'),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 16, bottom: 8, right: 16),
              child: HotelParametrsList()),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
