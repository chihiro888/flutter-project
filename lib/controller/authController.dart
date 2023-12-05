import 'package:get/get.dart';

class AuthController extends GetxController {
  // 핸드폰 인증
  String? _countryCode = "+82";
  String _verificationId = "";

  // 공통
  String _uid = "";
  String _nickname = "";
  String _gender = "";
  String _birth = "";
  List<String> profileList = [];

  String? getCountryCode() {
    return _countryCode;
  }

  String getVerificationId() {
    return _verificationId;
  }

  String getUid() {
    return _uid;
  }

  String getNickname() {
    return _nickname;
  }

  String getGender() {
    return _gender;
  }

  String getBirth() {
    return _birth;
  }

  void setCountryCode(String? countryCode) {
    _countryCode = countryCode;
  }

  void setVerificationId(String verificationId) {
    _verificationId = verificationId;
  }

  void setUid(String uid) {
    _uid = uid;
  }

  void setNickname(String nickname) {
    _nickname = nickname;
  }

  void setGender(String gender) {
    _gender = gender;
  }

  void setBirth(String birth) {
    _birth = birth;
  }
}
