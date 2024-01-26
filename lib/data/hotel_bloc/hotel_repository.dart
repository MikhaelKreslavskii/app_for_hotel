import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel_app/models/hotel.dart';

class HotelRepository {
  HotelRepository();
  Future<List<Hotel>> getHotelList() async {
    List<Hotel> hotelList = [];
    try {
      final response = await Dio()
          .get("https://run.mocky.io/v3/75000507-da9a-43f8-a618-df698ea7176d");
      log('response ${response.data}');
      final data = response.data;
      print(data[1].toString());
      print(data.length);

      print(data);

      final cur_data = data as Map<String, dynamic>;

      hotelList.add(
        Hotel(
            id: cur_data["id"],
            name: cur_data["name"],
            address: cur_data["adress"],
            minimalPrice: cur_data["minimal_price"],
            priceForIt: cur_data["price_for_it"],
            rating: cur_data["rating"],
            ratingName: cur_data["rating_name"],
            imageUrls: List<String>.from(cur_data["image_urls"]),
            description: cur_data["about_the_hotel"]["description"],
            peculiarities: List<String>.from(
                cur_data["about_the_hotel"]["peculiarities"])),
      );
      return hotelList;
    } catch (e) {
      log('$e');
      throw Exception();
    }
  }
}
