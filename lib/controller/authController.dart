import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  ImagePicker picker = ImagePicker();

  // 핸드폰 인증
  String? _countryCode = "+82";
  String _verificationId = "";

  // 공통
  String _uid = "";
  String _nickname = "";
  String _gender = "";
  String _birth = "";

  // 대표 프로필
  RxString _mainProfile = "".obs;

  // 서브 프로필 (5장)
  RxList<String> _profileList = <String>[].obs;

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

  String getMainProfile() {
    return _mainProfile.value;
  }

  String? getProfile(int index) {
    if (index >= 0 && index < _profileList.length) {
      return _profileList[index];
    } else {
      return null; // Index out of bounds
    }
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

  void selectMainProfile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    _mainProfile.value = pickedFile?.path ?? "";
  }

  void clearMainProfile() {
    _mainProfile.value = ""; // Clear the main profile path
  }

  void selectProfile() async {
    if (_profileList.length >= 5) {
      // 이미 5개의 프로필이 등록되어 있음
      return;
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _profileList.add(pickedFile.path);
    }
  }

  void removeProfile(int index) {
    if (index >= 0 && index < _profileList.length) {
      _profileList.removeAt(index);
    }
  }
}
