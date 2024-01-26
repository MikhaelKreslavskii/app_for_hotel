import 'package:flutter/material.dart';

import '../../models/booking.dart';
import 'booking_data_tile.dart';
import 'booking_price_tile.dart';

class BookingPrice extends StatefulWidget {
  final Booking booking;
  const BookingPrice({required this.booking});

  @override
  State<BookingPrice> createState() => _BookingPriceState();
}

class _BookingPriceState extends State<BookingPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, top: 8),
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookingPriceTile(
                    nameField: "Тур",
                    descriptionField: "${widget.booking.tourPrice} ₽"),
                BookingPriceTile(
                    nameField: "Топливный сбор",
                    descriptionField: "${widget.booking.fuelCharge} ₽"),
                BookingPriceTile(
                    nameField: "Сервисный сбор",
                    descriptionField: "${widget.booking.serviceCharge} ₽"),
                BookingPriceTile(
                    nameField: "К оплате",
                    descriptionField: "${widget.booking.tourPrice} ₽"),
                SizedBox(
                  height: 8,
                ),
              ],
            )),
          ),
        ]));
  }
}
