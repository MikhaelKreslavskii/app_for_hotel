import 'package:flutter/material.dart';

import '../../models/booking.dart';
import '../hotel_components/hotel_rating.dart';

class BookingHotelWidget extends StatelessWidget {
  final Booking hotel;
  const BookingHotelWidget({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: HotelRating(
                rating: hotel.horating,
                descrRating: hotel.ratingName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("${hotel.hotelName}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("${hotel.hotelAdress}",
                  style: TextStyle(
                      color: Color.fromARGB(255, 13, 114, 255),
                      fontSize: 14,
                      fontFamily: 'SF')),
            ),
          ],
        ),
      ),
    );
  }
}
