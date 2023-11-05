import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class PhoneForExp extends StatefulWidget {
  const PhoneForExp({Key? key}) : super(key: key);

  @override
  _PhoneForExpState createState() => _PhoneForExpState();
}

class _PhoneForExpState extends State<PhoneForExp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('전화번호로 로그인'),
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
