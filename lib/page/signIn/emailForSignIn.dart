import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class EmailForSignIn extends StatefulWidget {
  const EmailForSignIn({Key? key}) : super(key: key);

  @override
  _EmailForSignInState createState() => _EmailForSignInState();
}

class _EmailForSignInState extends State<EmailForSignIn> {
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
