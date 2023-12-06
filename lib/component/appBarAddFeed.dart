import 'package:get/get.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarAddFeed() {
  return AppBar(
    title: Text(
      "Feed",
      style: TextStyle(
        fontSize: 18,
        color: Colors.black, // Set font color to black
      ),
    ),
    backgroundColor: Colors.white, // Set background color to white
    elevation: 0, // Set elevation to 0
    automaticallyImplyLeading: true, // Control whether to show the back button
    leading: IconButton(
      icon: Icon(
        Icons.close, // Use the close (X) icon
        color: Colors.black, // Set icon color to black
      ),
      onPressed: () {
        // Handle back button press
        // You may want to use Get.back() instead of Get.toNamed('/feed')
        Get.back();
      },
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.send,
          color: Colors.black, // Set icon color to black
        ),
        onPressed: () {
          Get.toNamed('/feed');
        },
      ),
    ],
  );
}
