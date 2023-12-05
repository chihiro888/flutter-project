import 'package:flutter/material.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/controller/authController.dart';

class EmailForSignUpPassword extends StatefulWidget {
  const EmailForSignUpPassword({Key? key}) : super(key: key);

  @override
  _EmailForSignUpPasswordState createState() => _EmailForSignUpPasswordState();
}

class _EmailForSignUpPasswordState extends State<EmailForSignUpPassword> {
  // ** Controller
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _passwordFocusNode;

  // ** Handler
  _handleClickSendEmail() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "",
        password: _passwordController.text,
      );

      // If the registration is successful, you can navigate to the next screen
      // or perform any other actions you need.
      print("User registered: ${userCredential.user?.email}");

      // For email verification, you can send a verification email
      await userCredential.user?.sendEmailVerification();

      // Navigate to the email verification screen or show a success message.
      // For example:
      Get.toNamed('/emailForAuth');
    } catch (e) {
      print("Error registering user: $e");
      // Handle registration errors, for example, show an error message.
      // You can customize this based on your application's requirements.
    }
  }

  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.removeListener(_updateButtonState);
    _passwordController.dispose();
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
                "비밀번호를 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Text(
                "이메일 로그인 시 사용하실 비밀번호입니다.",
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
