import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample/page/main/home.dart';
import 'package:sample/page/signUp/profile.dart';
import 'package:sample/page/onBoarding/onBoarding.dart';
import 'package:sample/page/signIn/emailForSignIn.dart';
import 'package:sample/page/signIn/phoneForAuth.dart';
import 'package:sample/page/signIn/phoneForExp.dart';
import 'package:sample/page/signIn/phoneForReSend.dart';
import 'package:sample/page/signIn/phoneForSignIn.dart';
import 'package:sample/page/signIn/signIn.dart';
import 'package:sample/page/signUp/birth.dart';
import 'package:sample/page/signUp/complete.dart';
import 'package:sample/page/signUp/emailForAuth.dart';
import 'package:sample/page/signUp/emailForSignUp.dart';
import 'package:sample/page/signUp/gender.dart';
import 'package:sample/page/signUp/nickname.dart';
import 'firebase_options.dart';

void main() async {
  // 해당 코드 없으면 안드로이드에서 스플래시에서 멈춤
  WidgetsFlutterBinding.ensureInitialized();

  // 파이어베이스 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 어플리케이션 실행
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/onBoarding',
      getPages: [
        // 온보딩
        GetPage(name: '/onBoarding', page: () => const OnBoarding()),

        // 로그인
        GetPage(name: '/signIn', page: () => const SignIn()),
        GetPage(name: '/emailForSignIn', page: () => const EmailForSignIn()),
        GetPage(name: '/phoneForSignIn', page: () => const PhoneForSignIn()),
        GetPage(name: '/phoneForAuth', page: () => const PhoneForAuth()),
        GetPage(name: '/phoneForReSend', page: () => const PhoneForReSend()),
        GetPage(name: '/phoneForExp', page: () => const PhoneForExp()),

        // 회원가입
        GetPage(name: '/emailForSignUp', page: () => const EmailForSignUp()),
        GetPage(name: '/emailForAuth', page: () => const EmailForAuth()),
        GetPage(name: '/nickname', page: () => const Nickname()),
        GetPage(name: '/gender', page: () => const Gender()),
        GetPage(name: '/birth', page: () => const Birth()),
        GetPage(name: '/profile', page: () => const Profile()),
        GetPage(name: '/complete', page: () => const Complete()),

        // 홈
        GetPage(name: '/feed', page: () => const Home(selectedIndex: 0)),
        GetPage(name: '/friend', page: () => const Home(selectedIndex: 1)),
        GetPage(name: '/chat', page: () => const Home(selectedIndex: 2)),
        GetPage(name: '/develop', page: () => const Home(selectedIndex: 3)),
        GetPage(name: '/profile', page: () => const Home(selectedIndex: 4)),
      ],
    );
  }
}
