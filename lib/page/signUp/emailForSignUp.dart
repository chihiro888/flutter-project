import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:get/get.dart';

class EmailForSignUp extends StatefulWidget {
  const EmailForSignUp({Key? key}) : super(key: key);

  @override
  _EmailForSignUpState createState() => _EmailForSignUpState();
}

class _EmailForSignUpState extends State<EmailForSignUp> {
  // ** Controller
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _emailFocusNode;

  // ** Handler
  _handleClickSendEmail() {
    Get.toNamed('/emailForAuth');
  }

  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
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
      appBar: appBarDefault('이메일로 회원가입'),
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
              SizedBox(height: 8),
              Text(
                "가입을 위해 이메일이 필요해요.",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "이메일은 가입 여부 확인에만 활용되며 노출되지 않아요.",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
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
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: _confirmPasswordController,
                    onChanged: (text) {
                      _updateButtonState();
                    },
                    decoration: InputDecoration(
                      hintText: '비밀번호 확인',
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
                    visible: _confirmPasswordController.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFBBBBBB),
                        size: 16,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _confirmPasswordController.clear();
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
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary:
                          _isButtonEnabled ? Color(0xFF52A8F6) : Colors.grey,
                      elevation: 0,
                    ),
                    child: Text(
                      '인증메일 전송',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            _handleClickSendEmail();
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
