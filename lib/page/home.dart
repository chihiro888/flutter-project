import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();

  String buttonText = 'Button'; // 초기 버튼 텍스트

  // 버튼 클릭 시 버튼 텍스트를 변경하는 함수
  void handleClickButton() {
    setState(() {
      if (buttonText == 'Button') {
        buttonText = 'Clicked!';
      } else {
        buttonText = 'Button';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello")),
      body: SafeArea(
        // SafeArea 안에 안전하게 배치하고 싶은 모든 위젯을 넣습니다.
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('text'),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Enter your text',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 버튼을 화면의 하단에 고정
            Padding(
              padding:
                  const EdgeInsets.all(16.0), // 버튼 주변에 간격을 원하는 만큼 줄 수 있습니다.
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        handleClickButton();
                      },
                      child: Text(buttonText),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
