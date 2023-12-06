import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample/page/chat/chat.dart';
import 'package:sample/page/chat/chatList.dart';
import 'package:sample/page/community/addFeed.dart';
import 'package:sample/page/main/Layout.dart';
import 'package:sample/page/profile/follow.dart';
import 'package:sample/page/profile/personProfile.dart';
import 'package:sample/page/setting/setting.dart';
import 'package:sample/page/signUp/emailForSignUpAccount.dart';
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
import 'package:sample/page/signUp/emailForSignUpPassword.dart';
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

        // 전화번호로 로그인 > 전화번호 입력
        GetPage(name: '/phoneForSignIn', page: () => const PhoneForSignIn()),

        // 전화번호로 로그인 > 인증번호 인증
        GetPage(name: '/phoneForAuth', page: () => const PhoneForAuth()),

        // 전화번호로 로그인 > 인증번호 재전송
        GetPage(name: '/phoneForReSend', page: () => const PhoneForReSend()),

        // 전화번호로 로그인 > 인증번호 만료
        GetPage(name: '/phoneForExp', page: () => const PhoneForExp()),

        // 이메일로 로그인 > 이메일, 비밀번호 입력
        GetPage(name: '/emailForSignIn', page: () => const EmailForSignIn()),

        // 회원가입 > 이메일
        GetPage(
            name: '/emailForSignUpAccount',
            page: () => const EmailForSignUpAccount()),

        // 회원가입 > 비밀번호
        GetPage(
            name: '/emailForSignUpPassword',
            page: () => const EmailForSignUpPassword()),

        // 회원가입 > 이메일 인증
        GetPage(name: '/emailForAuth', page: () => const EmailForAuth()),

        // 회원가입 > 닉네임
        GetPage(name: '/nickname', page: () => const Nickname()),

        // 회원가입 > 성별
        GetPage(name: '/gender', page: () => const Gender()),

        // 회원가입 > 생년월일
        GetPage(name: '/birth', page: () => const Birth()),

        // 회원가입 > 프로필사진
        GetPage(name: '/profile', page: () => const Profile()),

        // 회원가입 > 완료
        GetPage(name: '/complete', page: () => const Complete()),

        // 레이아웃 > 홈
        GetPage(name: '/home', page: () => const Layout(selectedIndex: 0)),

        // 레이아웃 > 문제
        GetPage(name: '/problem', page: () => const Layout(selectedIndex: 1)),

        // 레이아웃 > 커뮤니티
        GetPage(name: '/community', page: () => const Layout(selectedIndex: 2)),

        // 레이아웃 > 랭킹
        GetPage(name: '/rank', page: () => const Layout(selectedIndex: 3)),

        // 레이아웃 > 나의 프로필
        GetPage(name: '/myProfile', page: () => const Layout(selectedIndex: 4)),

        // 설정
        GetPage(name: '/setting', page: () => const Setting()),

        // 커뮤니티 > 피드 추가
        GetPage(name: '/addFeed', page: () => const AddFeed()),

        // 커뮤니티 > 채팅 리스트
        GetPage(name: '/chatList', page: () => const ChatList()),

        // 커뮤니티 > 채팅
        GetPage(name: '/chat', page: () => const Chat()),

        // 커뮤니티 > 상대방 프로필
        GetPage(name: '/personProfile', page: () => const PersonProfile()),

        // 커뮤니티 > 팔로우/팔로잉
        GetPage(name: '/follow', page: () => const Follow()),
      ],
    );
  }
}
