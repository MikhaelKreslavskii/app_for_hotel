import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_app/data/hotel_bloc/hotel_bloc.dart';
import 'package:hotel_app/data/hotel_bloc/hotel_repository.dart';
import 'package:hotel_app/models/hotel.dart';
import 'package:hotel_app/pages/room_page.dart';

import '../components/hotel_components/hotel_first_widget.dart';
import '../components/hotel_components/hotel_second_widget.dart';

class HotelPage extends StatefulWidget {
  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  final _hotelBloc = HotelBloc();

  @override
  void initState() {
    _hotelBloc.add(LoadHotel());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          body: BlocBuilder<HotelBloc, HotelState>(
            bloc: _hotelBloc,
            builder: (context, state) {
              if (state is HotelLoaded) {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Align(
                      child: HotelFirstWidget(hotel: state.hotelList.first),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    HotelSecondWidget(hotel: state.hotelList.first),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                        width: 343,
                        height: 48,
                        child: Builder(builder: (context) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const RoomPage()),
                              );
                            },
                            child: Text(
                              "К выбору номера",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SF',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color.fromARGB(255, 13, 114, 255)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )),
                            ),
                          );
                        }))
                  ],
                ));
              }
              if (state is HotelLoadFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Error with connection."),
                      ElevatedButton(
                        onPressed: () {
                          _hotelBloc.add(LoadHotel());
                        },
                        child: Text("Try again"),
                      )
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
