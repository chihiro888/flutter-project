import 'package:flutter/material.dart';

PreferredSizeWidget appBarDefault(String title,
    {bool automaticallyImplyLeading = true}) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        color: Colors.black, // Set font color to black
      ),
    ),
    backgroundColor: Colors.white, // Set background color to white
    elevation: 0, // Set elevation to 0
    automaticallyImplyLeading:
        automaticallyImplyLeading, // Control whether to show the back button
  );
}
