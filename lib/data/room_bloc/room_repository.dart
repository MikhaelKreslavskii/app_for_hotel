import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hotel_app/models/hotel.dart';
import 'package:hotel_app/models/room.dart';
import 'dart:convert';

class RoomRepository {
  RoomRepository();
  Future<List<Room>> getRoomsList() async {
    List<Room> roomList = [];
    try {
      final response = await Dio()
          .get("https://run.mocky.io/v3/157ea342-a8a3-4e00-a8e6-a87d170aa0a2");
      log('response ${response.data}');
      final data = response.data["rooms"] as List;
      roomList = data.map((room) => Room.fromJson(room)).toList();
      print(roomList.length);
      return roomList;
    } catch (e) {
      log('$e');
      throw Exception();
    }
  }
}
