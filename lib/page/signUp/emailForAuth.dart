import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:get/get.dart';

class EmailForAuth extends StatefulWidget {
  const EmailForAuth({Key? key}) : super(key: key);

  @override
  _EmailForAuthState createState() => _EmailForAuthState();
}

class _EmailForAuthState extends State<EmailForAuth> {
  // ** Handler
  _handleClickVerify() {
    Get.toNamed('/nickname');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('이메일로 회원가입'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "sample@gamil.com",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                "이메일이 전송되었습니다.",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "이메일의 링크를 탭한 후에 아래 “인증하기” 버튼을 눌러주세요.",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
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
                        '인증하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _handleClickVerify();
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
