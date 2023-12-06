import 'package:get/get.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarChat() {
  return AppBar(
    title: Row(
      children: <Widget>[
        CircleAvatar(
          radius: 16,
          backgroundImage: AssetImage(
            'assets/images/sample/user.jpg',
          ),
        ),
        SizedBox(width: 12, height: 0.0),
        Text('marubanuru', style: TextStyle(fontSize: 16))
      ],
    ),
    backgroundColor: Colors.white, // Set background color to white
    elevation: 0, // Set elevation to 0
    automaticallyImplyLeading: true, // Control whether to show the back button
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.phone,
          color: Colors.black, // Set icon color to black
        ),
        onPressed: () {
          //
        },
      ),
      IconButton(
        icon: Icon(
          Icons.videocam_outlined,
          color: Colors.black, // Set icon color to black
        ),
        onPressed: () {
          //
        },
      ),
    ],
  );
}
