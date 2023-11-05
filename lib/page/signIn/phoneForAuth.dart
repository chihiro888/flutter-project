import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class PhoneForAuth extends StatefulWidget {
  const PhoneForAuth({Key? key}) : super(key: key);

  @override
  _PhoneForAuthState createState() => _PhoneForAuthState();
}

class _PhoneForAuthState extends State<PhoneForAuth> {
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
