import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 여기서 body의 배경색을 흰색으로 설정
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                // "Skip" 버튼이 눌렸을 때 처리할 로직 추가
              },
              child: Text(
                'Skip',
                style:
                    TextStyle(color: Color(0xFF9E9E9E)), // 폰트색상을 "#9E9E9E"로 변경
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Column을 수직 방향으로 가운데로 정렬
        children: [
          SizedBox(
            width: 500,
            height: 500,
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                _buildPage(
                  image: 'assets/images/ob1.png',
                  title: '우리가 만드는 MVP',
                  description: '서비스를 최소한의 기능으로 개발하여\n초기 버전을 빠르게 출시하는 개발',
                ),
                _buildPage(
                  image: 'assets/images/ob2.png',
                  title: '주요 기능을 단계적으로 릴리즈',
                  description: '처음부터 끝까지 기능을 만들지 않고\n모두가 함께 단계적으로 주요기능을 릴리즈',
                ),
                _buildPage(
                  image: 'assets/images/ob3.png',
                  title: '마시고 노는 개발 문화',
                  description: '앞으로 진행되는 프로젝트는 빠르게\n시간을 확보해서 마시고 놀자!',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Row를 수평 방향으로 가운데로 정렬
            children: [
              _buildIndicator(_currentPage == 0),
              SizedBox(width: 10),
              _buildIndicator(_currentPage == 1),
              SizedBox(width: 10),
              _buildIndicator(_currentPage == 2),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0,
                onPrimary:
                    _currentPage == 0 ? Color(0xFF9E9E9E) : Color(0xFF383838),
                fixedSize: Size(150, 50), // 너비와 높이 조절
              ),
              child: const Text(
                '뒤로',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 0,
                  fixedSize: Size(150, 50), // 너비와 높이 조절
                  backgroundColor: Color(0xFF52A8F6)),
              child: Text(
                _currentPage == 2 ? '시작하기' : '다음',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onPressed: () {
                if (_currentPage < 2) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Handle logic for the "시작하기" button press on the third page
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(
      {required String image,
      required String title,
      required String description}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 200), // 이미지 표시
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Center(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      width: 30,
      height: 12,
      decoration: BoxDecoration(
        shape: isActive ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isActive ? BorderRadius.circular(8) : null,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}

// BoxShape.circle