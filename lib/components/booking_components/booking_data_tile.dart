import 'package:flutter/material.dart';

class BookingDataTile extends StatelessWidget {
  final String nameField;
  final String descriptionField;
  const BookingDataTile(
      {required this.nameField, required this.descriptionField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$nameField",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'SF',
                  color: Color.fromARGB(255, 130, 135, 150)),
            ),
            SizedBox(
              width: 203,
              child: Text(
                "$descriptionField",
                style: TextStyle(fontFamily: 'SF', fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
