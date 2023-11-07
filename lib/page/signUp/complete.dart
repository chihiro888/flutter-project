import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class Complete extends StatefulWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  _CompleteState createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
  _handleClickHome() {
    Get.offAllNamed('/feed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('회원가입 완료'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "안진용님",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "회원가입을 축하합니다",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(width: 0.0, height: 8.0),
              Text(
                "타이탄 모바일 개발킷에 오신 것을 환영합니다",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Lottie.asset(
                  'assets/images/signUp/complete.json',
                  height: 250, // Adjust the height as per your requirement
                  width: 250, // Adjust the width as per your requirement
                ),
              ),
              Expanded(
                child: SizedBox(width: 0.0, height: 4.0),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF52A8F6),
                        elevation: 0,
                      ),
                      child: Text(
                        '회원가입',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _handleClickHome();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
