import 'package:flutter/material.dart';

PreferredSizeWidget appBarHome() {
  return AppBar(
    title: Text(
      "GPTOEIC",
      style: TextStyle(
        fontSize: 18,
        color: Colors.black, // Set font color to black
      ),
    ),
    backgroundColor: Colors.white, // Set background color to white
    elevation: 0, // Set elevation to 0
    automaticallyImplyLeading: false, // Control whether to show the back button
  );
}
