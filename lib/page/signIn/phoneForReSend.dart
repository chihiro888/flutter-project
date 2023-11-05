import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';

class PhoneForReSend extends StatefulWidget {
  const PhoneForReSend({Key? key}) : super(key: key);

  @override
  _PhoneForReSendState createState() => _PhoneForReSendState();
}

class _PhoneForReSendState extends State<PhoneForReSend> {
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
