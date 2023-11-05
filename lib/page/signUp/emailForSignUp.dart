import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class EmailForSignUp extends StatefulWidget {
  const EmailForSignUp({Key? key}) : super(key: key);

  @override
  _EmailForSignUpState createState() => _EmailForSignUpState();
}

class _EmailForSignUpState extends State<EmailForSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('이메일로 로그인'),
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
