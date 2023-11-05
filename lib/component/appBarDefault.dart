import 'package:flutter/material.dart';

PreferredSizeWidget appBarDefault(String title) {
  return AppBar(
    title: Text(title,
        style: TextStyle(
          fontSize: 18,
        )),
    backgroundColor: Colors.white, // Set background color to white
    foregroundColor: Colors.black, // Set font color to black
    elevation: 0, // Set elevation to 0
  );
}
