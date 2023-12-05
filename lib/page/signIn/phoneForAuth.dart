import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample/controller/authController.dart';
import 'package:sample/provider/firebaseProvider.dart';

class PhoneForAuth extends StatefulWidget {
  const PhoneForAuth({Key? key}) : super(key: key);

  @override
  _PhoneForAuthState createState() => _PhoneForAuthState();
}

class _PhoneForAuthState extends State<PhoneForAuth> {
  // ** Focus
  final pinputFocusNode = FocusNode();

  // ** Handler
  _handleCheckPin(String pin) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    AuthController authController = Get.put(AuthController());

    // ** Provider
    FirebaseProvider firebaseProvider = FirebaseProvider();

    try {
      print("v = " + authController.getVerificationId());
      print("pin = " + pin);

      // Create a PhoneAuthCredential using the verificationId and entered PIN
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: authController.getVerificationId(),
        smsCode: pin,
      );

      // Sign in the user with the credential
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      String uid = userCredential.user!.uid;
      bool isExist = await firebaseProvider.existUser(uid);

      if (isExist) {
        // User is already registered, navigate to the feed screen
        Get.toNamed('/feed');
      } else {
        // User is not registered, set the UID and navigate to the nickname screen
        authController.setUid(uid);
        Get.toNamed('/nickname');
      }
    } catch (e) {
      // Handle exceptions (e.g., FirebaseAuthException)
      print('Error verifying code: $e');
      // You may want to show an error message to the user
    }
  }

  // ** Life Cycle
  @override
  void initState() {
    super.initState();
    pinputFocusNode.requestFocus();
  }

  @override
  void dispose() {
    pinputFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double responsiveWidth = MediaQuery.of(context).size.width * 0.8;

    final defaultPinTheme = PinTheme(
      width: responsiveWidth / 7,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color(0xFFEEEEEE),
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

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
                "01091109033",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "전송된 인증번호를 입력해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(width: 0.0, height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    length: 6,
                    onCompleted: (pin) {
                      _handleCheckPin(pin);
                    },
                    showCursor: true,
                    focusNode: pinputFocusNode,
                    // validator: (s) {
                    //   return s == '222222' ? null : 'Pin is incorrect';
                    // },
                  ),
                ],
              ),
              SizedBox(width: 0.0, height: 24),
              Center(
                child: Text(
                  '03:00',
                  style: TextStyle(
                    color: Color(0xFFAAAAAA),
                  ),
                ),
              ),
              Expanded(child: SizedBox(width: 0.0, height: 8.0)),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Center(
                  child: Text('인증번호를 받지 못하였나요?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
