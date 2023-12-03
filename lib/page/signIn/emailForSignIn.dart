import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:get/get.dart';

class EmailForSignIn extends StatefulWidget {
  const EmailForSignIn({Key? key}) : super(key: key);

  @override
  _EmailForSignInState createState() => _EmailForSignInState();
}

class _EmailForSignInState extends State<EmailForSignIn> {
  // ** Controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _emailFocusNode;

  // ** Handler
  _handleClickSignIn() {
    Get.offAllNamed('/feed');
  }

  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  _handleClickSignUp() {
    Get.toNamed('/emailForSignUp');
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _emailController.removeListener(_updateButtonState);
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('이메일로 로그인'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "이메일과 비밀번호를 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 16),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _emailController,
                    onChanged: (text) {
                      _updateButtonState();
                    },
                    focusNode:
                        _emailFocusNode, // Assign the FocusNode to the TextField
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: '이메일',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // 포커스된 상태에서의 테두리를 투명하게 만듭니다.
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // 포커스되지 않은 상태의 테두리 색상을 흰색으로 설정합니다.
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _emailController.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFBBBBBB),
                        size: 16,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _emailController.clear();
                            _isButtonEnabled = false;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _passwordController,
                    onChanged: (text) {
                      _updateButtonState();
                    },
                    decoration: InputDecoration(
                      hintText: '비밀번호',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // 포커스된 상태에서의 테두리를 투명하게 만듭니다.
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // 포커스되지 않은 상태의 테두리 색상을 흰색으로 설정합니다.
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _passwordController.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFBBBBBB),
                        size: 16,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _passwordController.clear();
                            _isButtonEnabled = false;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(width: 0.0, height: 4.0),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      _handleClickSignUp();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      '회원가입',
                      style: TextStyle(
                        color: Color(0xFF52A8F6),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          _isButtonEnabled ? Color(0xFF52A8F6) : Colors.grey,
                      elevation: 0,
                    ),
                    child: Text(
                      '로그인',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            _handleClickSignIn();
                          }
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
