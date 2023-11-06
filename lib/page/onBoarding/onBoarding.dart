import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // ** Controller
  final PageController _pageController = PageController();

  // ** State
  int _currentPage = 0;

  // ** Handler
  // 로그인 페이지로 이동
  _handleMoveSignIn() {
    Get.toNamed('/signIn');
  }

  // 뒤로 버튼 클릭
  _handleClickPrev() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // "다음/시작하기" 버튼 클릭
  _handleClickNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _handleMoveSignIn();
    }
  }

  // ** Render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                _handleMoveSignIn();
              },
              child: const Text(
                '스킵',
                style: TextStyle(color: Color(0xFF9E9E9E)),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    animationAsset: 'assets/images/onBoarding/ob1.json',
                    title: '우리가 만드는 MVP',
                    description: '서비스를 최소한의 기능으로 개발하여\n초기 버전을 빠르게 출시하는 개발',
                  ),
                  _buildPage(
                    animationAsset: 'assets/images/onBoarding/ob2.json',
                    title: '주요 기능을 단계적으로 릴리즈',
                    description: '처음부터 끝까지 기능을 만들지 않고\n모두가 함께 단계적으로 주요기능을 릴리즈',
                  ),
                  _buildPage(
                    animationAsset: 'assets/images/onBoarding/ob3.json',
                    title: '마시고 노는 개발 문화',
                    description: '앞으로 진행되는 프로젝트는 빠르게\n시간을 확보해서 마시고 놀자!',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIndicator(_currentPage == 0),
                  const SizedBox(width: 10),
                  _buildIndicator(_currentPage == 1),
                  const SizedBox(width: 10),
                  _buildIndicator(_currentPage == 2),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0,
                        onPrimary: _currentPage == 0
                            ? Color(0xFF9E9E9E)
                            : Color(0xFF383838),
                        fixedSize: Size(150, 50),
                      ),
                      child: const Text(
                        '뒤로',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {
                        _handleClickPrev();
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          fixedSize: Size(150, 50),
                          backgroundColor: Color(0xFF52A8F6)),
                      child: Text(
                        _currentPage == 2 ? '시작하기' : '다음',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        _handleClickNext();
                      },
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

  Widget _buildPage({
    required String animationAsset,
    required String title,
    required String description,
  }) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              animationAsset,
              height: 250, // Adjust the height as per your requirement
              width: 250, // Adjust the width as per your requirement
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Center(
                child: Text(
                  description,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xFF636363)),
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
