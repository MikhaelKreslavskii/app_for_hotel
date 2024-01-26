import 'package:flutter/material.dart';

import '../../models/hotel.dart';
import 'hotel_image_scroll_card.dart';
import 'hotel_rating.dart';

class HotelFirstWidget extends StatelessWidget {
  final Hotel hotel;
  const HotelFirstWidget({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),

          /// height: 550,
          child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(
                    child: Text(
                  "Отель",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF'),
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Align(
                  child: HotelImageScrollCard(images: hotel.imageUrls),
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: HotelRating(
                  rating: hotel.rating,
                  descrRating: hotel.ratingName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Text(
                  "${hotel.name}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: Text("${hotel.address}",
                    style: TextStyle(
                        color: Color.fromARGB(255, 13, 114, 255),
                        fontSize: 14,
                        fontFamily: 'SF')),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 16),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "от ${hotel.minimalPrice} ₽",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'SF'),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8, top: 16),
                          child: Text(
                            "${hotel.priceForIt}",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'SF',
                                color: Color.fromARGB(255, 130, 135, 150)),
                          ))
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
