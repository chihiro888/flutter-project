import 'package:get/get.dart';

class AuthController extends GetxController {
  String? _countryCode = "+82";
  String _verificationId = "";

  String? getCountryCode() {
    return _countryCode;
  }

  String getVerificationId() {
    return _verificationId;
  }

  void setCountryCode(String? countryCode) {
    _countryCode = countryCode;
  }

  void setVerificationId(String verificationId) {
    _verificationId = verificationId;
  }
}
