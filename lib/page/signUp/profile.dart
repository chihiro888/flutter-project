import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/component/appBarDefault.dart';
import 'package:dotted_border/dotted_border.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // ** State
    bool _isButtonEnabled = true;

    _handleClickSignUp() {
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
                  _buildProfilePictureBox(context),
                  _buildProfilePictureBox(context),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildProfilePictureBox(context),
                  _buildProfilePictureBox(context),
                  _buildProfilePictureBox(context),
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

Widget _buildProfilePictureBox(context) {
  double imageSize =
      MediaQuery.of(context).size.width * 0.25; // 20% of the screen width
  return DottedBorder(
    color: Color(0xFFBABABA),
    strokeWidth: 1,
    radius: Radius.circular(8),
    dashPattern: [6, 3],
    child: Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          color: Colors.grey,
          size: imageSize *
              0.5, // Adjust the icon size relative to the container size
        ),
      ),
    ),
  );
}

Widget _buildMainProfilePictureBox(context) {
  double imageSize = MediaQuery.of(context).size.width * 0.25;

  return Stack(
    children: [
      DottedBorder(
        color: Color(0xFF52A8F6),
        strokeWidth: 1,
        radius: Radius.circular(8),
        dashPattern: [6, 3],
        child: Container(
          width: imageSize,
          height: imageSize,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: imageSize * 0.5,
            ),
          ),
        ),
      ),
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
  );
}
