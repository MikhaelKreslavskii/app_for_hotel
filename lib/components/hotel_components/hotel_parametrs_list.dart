import 'package:flutter/material.dart';

class HotelParametrsList extends StatelessWidget {
  const HotelParametrsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 197,
      color: Color.fromARGB(255, 251, 251, 252),
      child: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Image.asset("lib/assets/icons/happy_emoji.png"),
            title: Text(
              "Удобства",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 44, 48, 53),
                  fontFamily: 'SF',
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "Самое необходимое",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF',
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("lib/assets/icons/tick.png"),
            title: Text(
              "Что включено",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 44, 48, 53),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF'),
            ),
            subtitle: Text(
              "Самое необходимое",
              style: TextStyle(
                  fontSize: 14, fontFamily: 'SF', fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("lib/assets/icons/close_square.png"),
            title: Text(
              "Что не включено",
              style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 44, 48, 53),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'SF'),
            ),
            subtitle: Text(
              "Самое необходимое",
              style: TextStyle(
                  fontSize: 14, fontFamily: 'SF', fontWeight: FontWeight.w500),
            ),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
          ),
        ],
      ),
    );
  }
}
