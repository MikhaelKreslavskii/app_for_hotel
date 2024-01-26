import 'package:flutter/material.dart';
import 'package:hotel_app/components/booking_components/booking_data_tile.dart';

import '../../models/booking.dart';

class BookingDataWidget extends StatelessWidget {
  final Booking booking;
  const BookingDataWidget({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 8),
            child: Container(
              child: Column(
                children: [
                  BookingDataTile(
                      nameField: "Вылет из",
                      descriptionField: "${booking.departure}"),
                  BookingDataTile(
                      nameField: "Страна, город",
                      descriptionField: "${booking.arrivalCountry}"),
                  BookingDataTile(
                      nameField: "Даты",
                      descriptionField:
                          "${booking.tourDateStart} - ${booking.tourDateStop}"),
                  BookingDataTile(
                      nameField: "Кол-во ночей",
                      descriptionField: "${booking.numberOfNights} ночей"),
                  BookingDataTile(
                      nameField: "Отель",
                      descriptionField: "${booking.hotelName}"),
                  BookingDataTile(
                      nameField: "Номер", descriptionField: "${booking.room}"),
                  BookingDataTile(
                      nameField: "Питание",
                      descriptionField: "${booking.nutrition}"),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
