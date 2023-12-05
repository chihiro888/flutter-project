import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    print('Home');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 첫 번째: 광고배너
        Container(
          // 광고배너의 UI 및 스타일을 추가해주세요.
          child: YourAdBannerWidget(),
        ),
        // 두 번째: 토익 점수 표시 Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 현재 토익 점수
            Text('현재 토익 점수: 300', style: TextStyle(fontSize: 18)),
            // 목표 토익 점수
            Text('목표 토익 점수: 800', style: TextStyle(fontSize: 18)),
          ],
        ),
        // 세 번째: 공지사항
        Container(
          // 공지사항의 UI 및 스타일을 추가해주세요.
          child: YourNoticeWidget(),
        ),
      ],
    );
  }
}

// 광고배너 Widget
class YourAdBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 광고배너의 UI 및 스타일을 구현해주세요.
    return Container(
      // 광고배너의 내용과 스타일을 추가해주세요.
      child: Image.network(
        'https://scontent-ssn1-1.xx.fbcdn.net/v/t39.30808-6/311119543_5188473041264221_4566467780313716926_n.png?_nc_cat=104&ccb=1-7&_nc_sid=3635dc&_nc_ohc=C1fH5qlZfjMAX8Ak7Wy&_nc_ht=scontent-ssn1-1.xx&oh=00_AfA7oOo3h2m-oGHR9cxtwGyyb6nmtd2rc4kaU6uTny5gJA&oe=6574CAB8', // 여기에 광고배너 이미지 URL을 넣어주세요.
        fit: BoxFit.cover, // 이미지를 올바르게 표시하기 위한 옵션, 필요에 따라 수정해주세요.
      ),
    );
  }
}

// 공지사항 Widget
class YourNoticeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 공지사항의 UI 및 스타일을 구현해주세요.
    return Container(
        // 공지사항의 내용과 스타일을 추가해주세요.
        );
  }
}
