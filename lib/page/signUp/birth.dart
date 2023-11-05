import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class Birth extends StatefulWidget {
  const Birth({Key? key}) : super(key: key);

  @override
  _BirthState createState() => _BirthState();
}

class _BirthState extends State<Birth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('생년월일'),
      body: SafeArea(
        child: Column(
          children: [
            //
          ],
        ),
      ),
    );
  }
}
