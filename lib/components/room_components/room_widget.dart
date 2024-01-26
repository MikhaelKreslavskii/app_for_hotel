import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hotel_app/components/room_components/room_peculiarities_tile.dart';

import 'package:hotel_app/pages/booking_page.dart';

import '../../models/room.dart';
import '../hotel_components/hotel_image_scroll_card.dart';

class RoomWidget extends StatelessWidget {
  final Room room;
  RoomWidget({required this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        ///height: 539,
        width: 375,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: HotelImageScrollCard(images: room.imageUrls),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 16, right: 16),
            child: Text(
              "${room.name}",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w500, fontFamily: 'SF'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Wrap(children: [
                for (var i in room.peculiarities) RoomTile(peculiarities: i),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Container(
                width: 240,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 231, 241, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        "Подробнее о номере",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 13, 114, 255),
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color.fromARGB(255, 13, 114, 255),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16),
            child: Container(
              child: Row(
                children: [
                  Text(
                    "${room.price} Р",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'SF'),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 8, top: 16),
                      child: Text(
                        "${room.pricePer}",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 130, 135, 150),
                            fontFamily: 'SF'),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 16.0, left: 8, right: 8, bottom: 15),
            child: SizedBox(
                width: 343,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BookingPage()),
                    );
                  },
                  child: Text(
                    "Выбрать номер",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SF',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 13, 114, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    )),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
