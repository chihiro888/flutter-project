import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class PhoneForSignIn extends StatefulWidget {
  const PhoneForSignIn({Key? key}) : super(key: key);

  @override
  _PhoneForSignInState createState() => _PhoneForSignInState();
}

class _PhoneForSignInState extends State<PhoneForSignIn> {
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
