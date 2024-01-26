import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hotel_app/data/room_bloc/room_bloc.dart';
import 'package:hotel_app/models/room.dart';

import '../components/room_components/room_widget.dart';
import '../data/room_bloc/room_repository.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  final _roomBloc = RoomBloc();
  @override
  void initState() {
    _roomBloc.add(LoadRoom());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            "Steigenberger Makadi",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'SF',
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<RoomBloc, RoomState>(
          bloc: _roomBloc,
          builder: (context, state) {
            if (state is RoomLoaded) {
              return ListView.builder(
                  itemCount: state.roomList.length,
                  itemBuilder: ((context, index) {
                    return RoomWidget(room: state.roomList[index]);
                  }));
            }

            if (state is RoomLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Error with connection."),
                    ElevatedButton(
                      onPressed: () {
                        _roomBloc.add(LoadRoom());
                      },
                      child: Text("Try again"),
                    )
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
