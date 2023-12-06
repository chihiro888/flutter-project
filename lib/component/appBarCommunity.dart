import 'package:get/get.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarCommunity() {
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
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.black, // Set icon color to black
        ),
        onPressed: () {
          Get.toNamed('/addFeed');
        },
      ),
      IconButton(
        icon: Icon(
          Icons.chat_bubble_outline_sharp,
          color: Colors.black, // Set icon color to black
        ),
        onPressed: () {
          Get.toNamed('/chatList');
        },
      ),
    ],
  );
}
