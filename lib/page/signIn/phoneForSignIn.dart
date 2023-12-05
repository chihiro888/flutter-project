import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/controller/authController.dart';

class PhoneForSignIn extends StatefulWidget {
  const PhoneForSignIn({Key? key}) : super(key: key);

  @override
  _PhoneForSignInState createState() => _PhoneForSignInState();
}

class _PhoneForSignInState extends State<PhoneForSignIn> {
  // ** Controller
  TextEditingController _phoneNumberController = TextEditingController();
  AuthController authController = Get.put(AuthController());

  // ** State
  bool _isButtonEnabled = false;

  // ** Focus
  late FocusNode _phoneNumberFocusNode;

  // ** Handler
  _updateButtonState() {
    setState(() {
      _isButtonEnabled = _phoneNumberController.text.isNotEmpty;
    });
  }

  _handleClickSend() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    // 테스트용
    Get.toNamed('/phoneForAuth');

    // try {
    //   String phoneNumber =
    //       '${authController.getCountryCode()}${_phoneNumberController.text}';
    //   await _auth.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     verificationCompleted: (PhoneAuthCredential credential) async {
    //       //
    //     },
    //     verificationFailed: (FirebaseAuthException e) {
    //       print('Verification Failed: $e');
    //     },
    //     codeSent: (String verificationId, int? resendToken) {
    //       authController.setVerificationId(verificationId);
    //       Get.toNamed('/phoneForAuth');
    //     },
    //     codeAutoRetrievalTimeout: (String verificationId) {
    //       print('Code Auto Retrieval Timeout: $verificationId');
    //     },
    //   );
    // } catch (e) {
    //   print('Error sending verification code: $e');
    // }
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    _phoneNumberFocusNode = FocusNode();
    _phoneNumberController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _phoneNumberFocusNode.dispose();
    _phoneNumberController.removeListener(_updateButtonState);
    _phoneNumberController.dispose();
    super.dispose();
  }

  // ** Render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('전화번호로 로그인'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "전화번호를 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "안전을 위해 계정 확인이 필요해요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "가입 여부 확인에만 활용되며 노출되지 않아요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (data) {
                      authController.setCountryCode(data.dialCode);
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'KR',
                    favorite: ['+82', '+81'],
                    // optional. Shows only country name and flag
                    showCountryOnly: false,
                    // optional. Shows only country name and flag when popup is closed.
                    showOnlyCountryWhenClosed: false,
                    // optional. aligns the flag and the Text left
                    alignLeft: false,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          controller: _phoneNumberController,
                          onChanged: (text) {
                            _updateButtonState();
                          },
                          focusNode:
                              _phoneNumberFocusNode, // Assign the FocusNode to the TextField
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: '01000000000',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(
                                      0xFFFFFFFF)), // 포커스된 상태에서의 테두리를 투명하게 만듭니다.
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // 포커스되지 않은 상태의 테두리 색상을 흰색으로 설정합니다.
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                        ),
                        Visibility(
                          visible: _phoneNumberController.text.isNotEmpty,
                          child: IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Color(0xFFBBBBBB),
                              size: 16,
                            ),
                            onPressed: () {
                              setState(() {
                                _phoneNumberController.clear();
                                _isButtonEnabled = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(width: 0.0, height: 0.0),
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
                      '인증번호 받기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            _handleClickSend();
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
