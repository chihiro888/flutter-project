import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // ** Handler
  _handleClickKakao() {
    //
  }

  _handleClickGoogle() {
    //
  }

  _handleClickApple() {
    //
  }

  _handleClickFacebook() {
    //
  }

  _handleClickPhone() {
    Get.toNamed('/phoneForSignIn');
  }

  _handleClickEmail() {
    Get.toNamed('/emailForSignIn');
  }

  // ** Render
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
            SizedBox(height: 10.0),
            Center(
              child: Lottie.asset(
                'assets/images/signIn/logo.json',
                height: 200, // Adjust the height as per your requirement
                width: 300, // Adjust the width as per your requirement
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '타이탄 네트웍스',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Text(
                'More fast and powerful service',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF9B9B9B),
                ),
              ),
            ),
            _signInBtn(
              image: 'assets/images/signIn/kakaotalk.png',
              label: 'KakaoTalk으로 로그인',
              backgroundColor: 0xFF3C2823,
              fontColor: 0xFFFBEC47,
              onClick: () {
                _handleClickKakao();
              },
            ),
            _signInBtn(
              image: 'assets/images/signIn/google.png',
              label: 'Google로 로그인',
              backgroundColor: 0xFFFFFFFF,
              fontColor: 0xFF000000,
              onClick: () {
                _handleClickGoogle();
              },
            ),
            _signInBtn(
              image: 'assets/images/signIn/apple.png',
              label: 'AppleId로 로그인',
              backgroundColor: 0xFF000000,
              fontColor: 0xFFFFFFFF,
              onClick: () {
                _handleClickApple();
              },
            ),
            _signInBtn(
              image: 'assets/images/signIn/facebook.png',
              label: 'Facebook으로 로그인',
              backgroundColor: 0xFF52A8F6,
              fontColor: 0xFFFFFFFF,
              onClick: () {
                _handleClickFacebook();
              },
            ),
            _signInBtn(
              image: 'assets/images/signIn/phone.png',
              label: '전화번호로 로그인',
              backgroundColor: 0xFFFF918A,
              fontColor: 0xFFFFFFFF,
              onClick: () {
                _handleClickPhone();
              },
            ),
            _signInBtn(
              image: 'assets/images/signIn/email.png',
              label: '이메일로 로그인',
              backgroundColor: 0xFFFFD467,
              fontColor: 0xFFFFFFFF,
              onClick: () {
                _handleClickEmail();
              },
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }
}

Widget _signInBtn({
  required String image,
  required String label,
  required int backgroundColor,
  required int fontColor,
  required Function onClick,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(backgroundColor), // 배경색
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // border-radius 설정
        ),
      ),
      onPressed: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // 아이콘이 왼쪽에 위치하도록 설정
        children: <Widget>[
          Image.asset(
            image, // 아이콘 이미지 경로
            height: 24, // 아이콘 높이
            width: 24, // 아이콘 너비
          ),
          SizedBox(width: 8), // 아이콘과 텍스트 사이의 간격 조절
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: Color(fontColor), // 폰트색
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // 텍스트를 중앙에 정렬
            ),
          ),
        ],
      ),
    ),
  );
}
