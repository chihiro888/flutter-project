import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class Nickname extends StatefulWidget {
  const Nickname({Key? key}) : super(key: key);

  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('닉네임'),
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
