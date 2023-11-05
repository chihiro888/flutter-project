import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Title'),
        leading: IconButton(
          icon: Icon(Icons.close), // 엑스(X) 모양의 아이콘을 추가
          onPressed: () {
            // 뒤로가기 버튼이 눌렸을 때 수행할 동작 추가
            Navigator.of(context).pop();
          },
          color: Colors.black, // 아이콘의 색상을 검은색으로 지정
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Center(
              child:
                  Image.asset('assets/images/signIn/signIn.png', height: 200),
            ),
            Text(
              '타이탄 네트웍스',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'More fast and powerful service',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9B9B9B),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF3C2823), // 배경색
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // border-radius 설정
                  ),
                ),
                onPressed: () {
                  //
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // 아이콘이 왼쪽에 위치하도록 설정
                  children: <Widget>[
                    Image.asset(
                      'assets/images/signIn/kakaotalk.png', // 아이콘 이미지 경로
                      height: 24, // 아이콘 높이
                      width: 24, // 아이콘 너비
                    ),
                    SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조절
                    Expanded(
                      child: Text(
                        'KakaoTalk으로 로그인',
                        style: TextStyle(
                          color: Color(0xFFFBEC47), // 폰트색
                        ),
                        textAlign: TextAlign.center, // 텍스트를 중앙에 정렬
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
