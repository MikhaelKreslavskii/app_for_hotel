import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../models/booking.dart';

class BookingRepository {
  Future<Booking> getBooking() async {
    Booking? booking;

    try {
      final response = await Dio()
          .get("https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff");
      log('response ${response.data}');
      final data = response.data as Map<String, dynamic>;
      booking = Booking.fromJson(data);

      return booking;
    } catch (e) {
      throw Exception();
      // TODO
    }
  }
}
