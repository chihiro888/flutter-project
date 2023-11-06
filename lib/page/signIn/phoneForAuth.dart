import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:pinput/pinput.dart';

class PhoneForAuth extends StatefulWidget {
  const PhoneForAuth({Key? key}) : super(key: key);

  @override
  _PhoneForAuthState createState() => _PhoneForAuthState();
}

class _PhoneForAuthState extends State<PhoneForAuth> {
  // ** Focus
  final pinputFocusNode = FocusNode();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: Color(0xFFEEEEEE),
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // ** Handler
  _handleCheckPin(String pin) {
    Get.toNamed('/nickname');
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    pinputFocusNode.requestFocus();
  }

  @override
  void dispose() {
    pinputFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('전화번호로 로그인'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "01091109033",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "전송된 인증번호를 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(width: 0.0, height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    onCompleted: (pin) {
                      _handleCheckPin(pin);
                    },
                    showCursor: true,
                    focusNode: pinputFocusNode,
                    // validator: (s) {
                    //   return s == '222222' ? null : 'Pin is incorrect';
                    // },
                  ),
                ],
              ),
              SizedBox(width: 0.0, height: 24),
              Center(
                child: Text(
                  '03:00',
                  style: TextStyle(
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
              Expanded(child: SizedBox(width: 0.0, height: 8.0)),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Center(
                  child: Text('인증번호를 받지 못하였나요?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
