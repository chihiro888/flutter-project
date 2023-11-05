import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class EmailForAuth extends StatefulWidget {
  const EmailForAuth({Key? key}) : super(key: key);

  @override
  _EmailForAuthState createState() => _EmailForAuthState();
}

class _EmailForAuthState extends State<EmailForAuth> {
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
