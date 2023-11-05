import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('성별'),
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
