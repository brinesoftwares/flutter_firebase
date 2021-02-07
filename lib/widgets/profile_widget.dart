import 'package:flutter/material.dart';

Widget ProfileWidget(String title, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),
      ),
      SizedBox(
        height: 3,
      ),
      Text(
        value,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
