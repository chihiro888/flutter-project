import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailForSignUpAccount extends StatefulWidget {
  const EmailForSignUpAccount({Key? key}) : super(key: key);

  @override
  _EmailForSignUpAccountState createState() => _EmailForSignUpAccountState();
}

class _EmailForSignUpAccountState extends State<EmailForSignUpAccount> {
  // ** Controller
  TextEditingController _emailController = TextEditingController();

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _emailFocusNode;

  // ** Handler
  _handleClickSendEmail() async {
    Get.toNamed('/emailForSignUpPassword');
  }

  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailController.text.isNotEmpty;
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
                "이메일을 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                "입력하신 이메일로 인증메일이 전송됩니다.",
                style: TextStyle(
                    fontSize: 12,
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
                      '다음',
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
