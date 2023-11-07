import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  // ** Handler
  handleClickGender(String gender) {
    Get.toNamed('/birth');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('성별'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "성별을 선택해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "성별은 나중에 변경할 수 없어요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          handleClickGender('M');
                        },
                        child: Container(
                          width: 150, // 원하는 너비 설정
                          height: 200, // 원하는 높이 설정
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFC6C6C6),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/signUp/boy.png"),
                              SizedBox(width: 0.0, height: 8.0),
                              Center(
                                child: Text(
                                  '남자',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF52A8F6),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16), // 이미지 사이 간격 조절
                      GestureDetector(
                        onTap: () {
                          handleClickGender('F');
                        },
                        child: Container(
                          width: 150, // 원하는 너비 설정
                          height: 200, // 원하는 높이 설정
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFC6C6C6),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset("assets/images/signUp/girl.png"),
                              SizedBox(width: 0.0, height: 8.0),
                              Center(
                                child: Text(
                                  '여자',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF918A),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
