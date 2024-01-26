import 'package:flutter/material.dart';

class RoomTile extends StatelessWidget {
  final String peculiarities;
  const RoomTile({required this.peculiarities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 0.0, top: 8.0, bottom: 8),
      child: Container(
        width: 130,

        /// height: 29,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromARGB(255, 251, 251, 252)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            "$peculiarities",
            style: TextStyle(
                color: Color.fromARGB(255, 130, 135, 150),
                fontSize: 16,
                fontFamily: 'SF',
                fontWeight: FontWeight.w500),
          ),
        )),
      ),
    );
  }
}
