import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sample/controller/authController.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/provider/firebaseProvider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    FirebaseProvider firebaseProvider = FirebaseProvider();

    // ** State
    bool _isButtonEnabled = true;

    // 회원가입
    _handleClickSignUp() async {
      // 대표 프로필 업로드
      String mainProfile = authController.getMainProfile();
      String? mainProfileUrl = await firebaseProvider.uploadImage(mainProfile);

      // 서브 프로필 (5장) 업로드
      List<String?> subProfileUrlList = [];
      for (int i = 0; i < 5; i++) {
        String? profile = authController.getProfile(i);
        if (profile != null) {
          String? imageUrl = await firebaseProvider.uploadImage(profile);
          subProfileUrlList.add(imageUrl);
        } else {
          subProfileUrlList.add(null);
        }
      }

      // 기본정보
      String uid = authController.getUid();
      String nickname = authController.getNickname();
      String gender = authController.getGender();
      String birth = authController.getBirth();

      // 회원가입
      await firebaseProvider.createUser(
          uid,
          nickname,
          gender,
          birth,
          mainProfileUrl,
          subProfileUrlList[0],
          subProfileUrlList[1],
          subProfileUrlList[2],
          subProfileUrlList[3],
          subProfileUrlList[4]);

      Get.toNamed('/complete');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefault('프로필'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.0, height: 16.0),
              Text(
                "프로필을 등록해주세요",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              SizedBox(height: 8),
              Text(
                "나를 어필할 수 있는 사진으로 등록해주세요",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFA1A1A1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMainProfilePictureBox(context),
                  _buildProfilePictureBox(context, 0),
                  _buildProfilePictureBox(context, 1),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProfilePictureBox(context, 2),
                  _buildProfilePictureBox(context, 3),
                  _buildProfilePictureBox(context, 4),
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
                      '회원가입',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _isButtonEnabled
                        ? () {
                            _handleClickSignUp();
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

Widget _buildProfilePictureBox(BuildContext context, int index,
    {bool isMainProfile = false}) {
  AuthController authController = Get.put(AuthController());

  double imageSize = MediaQuery.of(context).size.width * 0.25;

  return GestureDetector(
    onTap: () {
      isMainProfile
          ? authController.selectMainProfile()
          : authController.selectProfile();
    },
    child: Stack(
      children: [
        DottedBorder(
          color: isMainProfile ? Color(0xFF52A8F6) : Color(0xFFBABABA),
          strokeWidth: 1,
          radius: Radius.circular(8),
          dashPattern: [6, 3],
          child: Obx(() {
            String? profilePath = isMainProfile
                ? authController.getMainProfile()
                : authController.getProfile(index);

            return Container(
              width: imageSize,
              height: imageSize,
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: profilePath != null && profilePath != ""
                  ? Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Center(
                            child: Image.file(
                              File(profilePath),
                              fit: BoxFit
                                  .contain, // Add this line for proper fitting
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {
                              isMainProfile
                                  ? authController.clearMainProfile()
                                  : authController.removeProfile(index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: imageSize * 0.5,
                      ),
                    ),
            );
          }),
        ),
        if (isMainProfile)
          Positioned(
            left: 4,
            top: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF52A8F6),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '대표',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _buildMainProfilePictureBox(BuildContext context) {
  return _buildProfilePictureBox(context, 0, isMainProfile: true);
}
